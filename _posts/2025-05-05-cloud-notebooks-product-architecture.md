---
title: "Cloud Notebooks Product Architecture"
categories: webdev
author: Andrei Radulescu-Banu
layout: post
---

# Requirements for Jupyter Notebook Server Implementation

## Core Functionality
1. Create a Jupyter notebook-based server that allows local development with remote execution
2. Support Python notebooks only
3. Enable notebooks to run as jobs on EC2 instances
4. Support both foreground (interactive) and background job execution modes

## EC2 Instance Management
1. Spin up and terminate EC2 instances dynamically per job
2. Each notebook job runs on a single EC2 instance (no multi-node clusters)
3. No persistent pool of EC2 instances needed
4. No auto-scaling or spot instance optimization required initially

## Job Execution Features
1. Provide real-time monitoring of logs and outputs during job execution
2. Allow users to assign notebooks to specific EC2 instance types
3. Support both interactive and background execution modes

## User Interface & API
1. Expose an API and UI for job scheduling and management
2. Enable viewing of execution logs
3. Provide job management controls (start, stop, schedule)

## Authentication & Security
1. Implement role-based access control for users submitting jobs
2. Secure API endpoints and notebook execution environment

## Data Storage
1. Store job outputs in MongoDB (not S3)
2. Persist notebooks and execution results for future reference

## Architecture Pattern
1. Follow Databricks-like job execution model
2. Support local development workflow with remote execution capability

# Implementation Notes from GPT

## Jupyter Notebook Job Execution on Dynamic EC2 Instances – Solution Design

### Architecture and Technology Stack

**Overview**: The system will consist of a central server that handles user requests (job submissions, scheduling, monitoring) and launches ephemeral EC2 instances to run each notebook job. This ephemeral, per-job instance approach is similar to Databricks “job clusters” which are created for a task and auto-terminated on completion​
docs.informatica.com
. It avoids any always-on cluster, reducing costs by only using EC2 resources during job execution​
qubole.com
. The design is Python-centric – both the notebooks and the orchestration components use Python for simplicity and consistency.

**Core Components**:

    **API Server & UI**: A Python web application (e.g. Flask or FastAPI) will provide a RESTful API and a web UI for users to submit notebooks, schedule jobs, and monitor progress. This server manages job metadata and user authentication. (For example, the open-source Notebooker tool uses a Flask web app with MongoDB to schedule and share Jupyter notebooks​
    mljar.com
    , which is a similar stack we can leverage.)
    Notebook Execution Engine: Notebook jobs are executed using Papermill, a library that runs Jupyter notebooks programmatically. Papermill was chosen because it supports parameterizing notebooks and executing them end-to-end, capturing all outputs in the output notebook​
    dev.to
    . Unlike running raw .py scripts, Papermill ensures the entire notebook (with charts, tables, print statements, etc.) is executed and saved with outputs​
    dev.to
    . Only Python notebooks are supported, which simplifies the environment (one kernel type to manage).
    AWS EC2 Instances: Each job spawns a dedicated EC2 instance (e.g. using AWS SDK boto3). There is no long-running worker pool; instead, each instance is launched on demand and terminated after the notebook run. This provides strong isolation (each job in its own VM) and mimics ephemeral cluster behavior for cost savings​
    docs.informatica.com
    . We will prepare a suitable Amazon Machine Image (AMI) with Python, Jupyter, Papermill, and any common libraries pre-installed to minimize startup time.
    MongoDB Database: A MongoDB instance (or cluster) serves as the system’s database for job metadata and outputs. It stores job definitions, schedules, status, and the results of notebook runs. When a notebook completes, its output (executed notebook file and/or logs) will be persisted in MongoDB rather than S3. This central store makes it easy to query and retrieve results via the API/UI. (Notably, Notebooker also uses MongoDB as its backend database for storing notebooks and schedules​
    mljar.com
    , indicating Mongo’s suitability for this kind of data.)

**Technology Stack Summary**:

    **Backend Framework**: Flask (with Flask-RESTful or Flask API) or FastAPI for building REST endpoints. These frameworks integrate well with Python libraries and can easily handle token-based auth for RBAC.
    **Execution Library**: Papermill for running notebooks. (Papermill can inject parameters and execute a .ipynb, producing an output notebook with all cell outputs​
    dev.to
    .)
    **AWS SDK**: Boto3 for EC2 instance management (launch/terminate instances, etc.). Optionally AWS Systems Manager (SSM) for remote command execution on instances.
    **Database**: MongoDB for storing jobs and outputs. We’ll use a Python driver (like pymongo) or an ODM to interact with Mongo.
    **Frontend**: A simple web UI (could be a single-page app with React/Vue or server-rendered templates) for user-friendly interaction. This will consume the REST API. The UI is not overly complex – mainly forms for job submission/scheduling and pages for status and output viewing.
    **Auth**: JWT (JSON Web Tokens) or session-based auth with role checks for RBAC. The stack may include an auth library (like Flask-JWT-Extended or FastAPI’s OAuth2 support) and secure password storage (passlib or bcrypt for hashing).

By using these technologies, we ensure a solution that is fully Python-based and similar in spirit to existing solutions (e.g. Jupyter Scheduler, Databricks Jobs, Notebooker) but tailored to run on ephemeral EC2 infrastructure.
## Dynamic EC2 Instance Setup and Management

Each notebook job will trigger the dynamic provisioning of an EC2 instance to execute the notebook in an isolated environment. Below are the steps and best practices for this process:

    **AMI and Instance Configuration**: We will create or choose an AMI that has the required environment for Python notebooks. For example, an AMI based on Ubuntu or Amazon Linux 2 with Python3, Jupyter, and Papermill pre-installed (along with common data science libraries if needed). Having packages pre-installed dramatically reduces setup time per job. In addition, the AMI will have the AWS SSM Agent installed to allow running commands via AWS Systems Manager (this is included by default in Amazon Linux). The instance size (CPU/memory) can be determined by the job request or a default configuration. No special persistent storage is needed beyond the root volume (notebook output will be sent to MongoDB). We will ensure the instance has an IAM role with minimal permissions (for example, rights to use SSM and perhaps to fetch code from a repository, but no broad AWS access). Security groups will be locked down (no public ingress needed if using SSM; only the orchestrator can connect).

    Launching the Instance: When a user submits a job, the server uses boto3 to call ec2.run_instances(...) with the chosen AMI ID, instance type, and an initialization script (user data). The user-data script will automate the execution of the notebook on that instance. For example, the user data may be a bash script that: (1) downloads the notebook code to the instance (e.g., via an API call, or from a git repo or shared storage), (2) runs Papermill to execute the notebook, and (3) uses a Python snippet or API call to send the results (notebook output and logs) back to the central server or directly to MongoDB. We can also pass the job ID and any parameters as part of the user data or instance tags so the instance knows what to run. Alternatively, instead of user data, we can launch the instance and then use AWS SSM Run Command to remotely execute a prepared script/command on the instance (e.g., a command to run Papermill). SSM can be convenient for control and error capturing without needing SSH keys. In either case, the instance is started on-demand for the job – there is no pre-warmed pool.

    **Executing the Notebook on EC2**: On the instance side, Papermill will run the notebook. For example, the instance might execute a command like: papermill input.ipynb output.ipynb -p param1 val1 ... (Papermill takes an input notebook and an output notebook path)​
    dev.to
    . Papermill’s execution engine will run all cells in order, injecting parameters if provided, and save the fully executed notebook (with outputs) to output.ipynb​
    dev.to
    . All cell outputs (print statements, plots, errors) become part of that output notebook​
    dev.to
    . This output file will later be sent to the MongoDB. If any error occurs during execution, Papermill will record it and stop, and we will capture that as a failed status.

    **Monitoring and Logging**: To get real-time status, the instance can report back its progress. A simple approach is to use CloudWatch Logs or SSM to stream logs. For instance, we could configure Papermill to log cell execution progress to stdout, which the AWS SSM agent can capture. The orchestrator can periodically call ssm.get_command_invocation to retrieve partial output, or the instance can push logs to the server (e.g., via a WebSocket or an API endpoint) incrementally. This is described more in the next section on monitoring.

    **Termination and Cleanup**: Once the notebook is executed and results are sent back, the EC2 instance should be terminated promptly. We have a couple of options: The instance can self-terminate by including an shutdown -h now at the end of the user-data script (after sending results). Alternatively, the orchestrator can terminate it via AWS API after detecting that the job is finished. Either way, the instance’s lifespan is tied to the single job run. AWS tags will be applied to mark the instance with the job ID, user, etc., for traceability and to avoid orphaned resources. If a job is canceled by the user, the orchestrator will issue a terminate command to stop the instance. This ephemeral lifecycle (“create, run, terminate”) ensures no idle instances remain running (an approach in line with transient EMR clusters that shut down after tasks​
    docs.informatica.com
    ).

    **Instance Management Best Practices**: We will implement retries or timeouts for instance creation (in case of AWS capacity issues) and have a timeout for notebook execution (to handle runaway jobs). AWS allows setting a termination protection flag, but since these are short-lived, we won’t use that – instead, we’ll rely on our logic to always terminate. We will also handle failed startups (if an instance fails to launch or the user-data fails early, the orchestrator will mark the job as failed and clean up that instance). Using SSM where possible can eliminate the need to open SSH ports or manage keys, improving security. All sensitive information (like MongoDB credentials or API keys needed on the instance) will be passed via secure means – e.g., as environment variables in the user data (ensuring the IAM role limits access to the user-data), or fetched from AWS Secrets Manager within the instance if available.

By following these steps, each job’s EC2 instance is isolated, configured with everything needed to run the notebook, and automatically cleaned up. This dynamic provisioning gives flexibility similar to Databricks job clusters but within our own controlled environment (no always-on infrastructure). The concept of ephemeral clusters provides efficiency: “clusters are created, exist for the time it takes for jobs to complete, and then cease to exist when tasks are done”​
docs.informatica.com
– we apply this to single-node EC2 execution of notebooks.
## Real-Time Notebook Execution Monitoring (Foreground vs. Background Jobs)

The solution supports both interactive (foreground) execution and queued or scheduled (background) execution of notebook jobs. The key difference lies in how the user interacts with the job’s output in real time:

    **Foreground Interactive Execution**: When a user runs a job in foreground mode (e.g. by clicking “Run Now” in the UI), they likely want to see logs and results as the notebook executes. To enable this, the system will stream real-time output from the running EC2 instance back to the client. The API server can establish a WebSocket or Server-Sent Events (SSE) channel to push log lines to the UI. For example, as Papermill runs each cell, it prints execution progress and any print() outputs or errors to stdout; these will be captured and forwarded to the user. We can leverage Papermill’s built-in logging of cell execution (it prints messages like “Executing cell 1” and any cell outputs in real time). The orchestrator could maintain an open socket to the instance (via SSH or SSM port forwarding) to read the process output live, or continuously poll the instance’s CloudWatch log stream for new entries. In practice, a simpler design is: run Papermill with --log-output option and have a small agent or script on the instance send those logs to the server WebSocket. The UI will display the logs line by line, giving an experience similar to watching a Jupyter notebook cell execution or Databricks notebook run. If the notebook produces graphical output, those are captured as images in the output notebook (not streamed in real time), but textual results and progress can be streamed.

    **Background Execution**: In background mode, the job is run asynchronously. The user might schedule it for later or just not wait for it interactively. The job will execute in the same way on its EC2 instance, but the user is not actively watching logs. The API call to submit the job will return immediately with a job ID, rather than holding open a connection. The user can later query the job’s status or retrieve results once it’s done. Importantly, even for background jobs, the system will capture all logs and outputs – they will just be stored for later viewing instead of streamed live. The server will still monitor the EC2 instance in the background, updating the job status in MongoDB (e.g., from “Running” to “Succeeded” or “Failed” when complete). Users can check status via an endpoint or UI page. This is useful for scheduled overnight jobs or long runs – you don’t need to keep a browser open.

    **Real-Time Log Handling**: Under the hood, both foreground and background jobs use a common logging mechanism – the difference is whether there is an active client session attached. We will implement a log buffer on the server side. As the instance produces logs, the orchestrator will append them to the job’s log in MongoDB (or an in-memory buffer) in real time. This ensures that even if no one is watching live, the logs are not lost – they are persisted for future inspection. In fact, to troubleshoot a background job, the user can open the job’s log view at any time and see the accumulated output. This addresses the challenge that Qubole noted with ephemeral clusters: once a job’s cluster is gone, you still need access to its logs​
    qubole.com
    . Our solution persists logs externally (in MongoDB) as they are generated, so that users can retrieve them even after the EC2 instance is terminated​
    qubole.com
    . This is critical for transparency and debugging: the design provides “the illusion of an always-on persistent cluster (which in reality is a series of ephemeral ones)”​
    qubole.com
    by retaining history.

    **Mechanism for Log Streaming**: The API server will have an endpoint or socket for streaming logs. One approach is using WebSockets (the UI could connect to /ws/jobs/<id>/logs). When a job starts, the server begins relaying logs to any connected clients for that job. If no client is connected (background run), the server simply writes logs to the database. We will ensure that connecting later will retrieve the full log from the DB. Alternatively, the UI can poll an endpoint (GET /jobs/<id>/logs) every few seconds for new log lines if WebSockets are not used – this is simpler but less real-time. Given modern web apps, WebSocket/SSE is preferred for a smooth live feed. The server will need to broadcast new log lines to the WebSocket in a thread-safe manner (libraries like Flask-SocketIO can help, or using an async framework like FastAPI which natively supports WebSockets). We’ll also include timestamps or sequence numbers with log entries for clarity.

    **Handling Notebook Outputs**: Beyond plain text logs, notebooks can produce rich output (images, HTML, etc.). Those are captured in the executed notebook file rather than streamed as raw logs. Our real-time feed will primarily show text outputs (e.g. from print or exceptions). If we want, we could detect when the notebook finishes and then automatically display a link or preview of the final notebook output. For example, once Papermill execution is done, the UI could fetch the rendered notebook (perhaps convert the output notebook to HTML and show it). But during execution, we stick to streaming textual logs for simplicity. (Databricks, for instance, streams the cell outputs in its notebook interface, but implementing a full cell-by-cell UI is complex. We will stream all outputs in sequence as a log stream.)

    **Progress and Status Updates**: The system can also emit high-level status in real time – e.g., “Job started at 12:00”, “Executing cell 5/20…”, “Completed successfully at 12:10”. Papermill by default logs the notebook progress (it reports a percentage of completion for cells). We can use those logs or add our own lightweight heartbeat. The UI’s job status indicator will update accordingly (perhaps showing a spinner or progress bar if we can compute % of cells done).

    **Resource Monitoring**: (Optional) We could also stream resource usage logs (like CPU/memory usage on the EC2) if needed to debug performance, using CloudWatch metrics or top outputs, but this is beyond core requirements.

In summary, foreground jobs give users a live window into the notebook’s execution, while background jobs run unattended but still record everything. The API/UI supports both: users can start a run interactively or schedule it for later. Importantly, all runs produce persisted logs and output notebooks that can be accessed after the fact. This aligns with typical use cases noted by AWS for scheduled notebook jobs – e.g. running long notebooks in the background or on a schedule, and later reviewing the results​
aws.amazon.com
. Our design ensures the user will have the same information whether they watched it live or not, thanks to continuous log capture to the MongoDB.
## Job Scheduling and Management API/UI

We will expose a set of RESTful API endpoints (and a web UI that consumes them) to allow users to submit notebooks, schedule recurring jobs, monitor progress, and manage past runs. Here are the key API endpoints and their functionality:

    Submit a Job – POST /api/jobs: Submit a new notebook job for execution. The request can include the notebook code or a reference to it (for example, an uploaded file or a Git repository path), plus any execution parameters (e.g., parameters to pass into the notebook) and optional configuration like desired instance type or environment variables. The server will authenticate the user, enqueue the job, and respond with a unique job ID. If the request indicates a foreground run (say, by a flag ?wait=true or a different endpoint like /api/jobs/submitAndWatch), the server might hold the connection open to stream logs (or upgrade to a WebSocket after submission). In most cases, the submission returns quickly with the job ID, and the client can use other endpoints or sockets to track progress. This is analogous to how Databricks Jobs API’s run submission returns a run_id for tracking​
    chaosgenius.io
    ​
    chaosgenius.io
    . Our implementation will likely simply return a JSON like {"job_id": "<uuid>", "status": "queued"}.

    Schedule a Job – POST /api/schedules: (If scheduling is required) This endpoint allows creating a scheduled job that runs a notebook at specified times (cron syntax or periodic interval). The payload would include the notebook reference, parameters, and a schedule (e.g., cron expression "0 0 * * *" for daily midnight). The server will store this as a job definition with an ID and ensure that jobs are automatically triggered at those times. Under the hood, this could integrate with a scheduler (like APScheduler in the server process, or even trigger AWS CloudWatch Events/Lambda if we wanted external scheduling). For simplicity, we can use an internal scheduler thread that checks the MongoDB for due jobs and invokes them. Each scheduled run will produce a new job instance (with its own job ID) that can be monitored via the usual jobs endpoints. The response to creating a schedule might include a schedule_id and the next run time.

    List Jobs – GET /api/jobs: Retrieve a list of past and present job runs for the user (or for all users, if an admin with appropriate role – see RBAC). This will query MongoDB for job records, filter by the authenticated user’s permissions, and return an array of jobs with summary info (job ID, name/notebook, status, start time, end time, etc). We will support query parameters to filter or sort, e.g. ?status=running or ?limit=50 for pagination. The UI will use this to show a table of the user’s recent runs and their current status. For recurring jobs, we might have separate endpoints or include a flag to list job definitions (schedules) versus job instances (runs). We might implement GET /api/schedules for listing scheduled jobs definitions.

    Get Job Status/Detail – GET /api/jobs/{job_id}: Get detailed information on a specific job run. This includes all metadata like the submitting user, start time, end time (if finished), current status (“queued”, “running”, “failed”, “success”), and possibly resource information (instance ID, instance type). We can also include links or sub-fields for logs and output. Essentially, this is a job descriptor. For example, Databricks provides a similar endpoint to get run metadata by run_id​
    chaosgenius.io
    ​
    chaosgenius.io
    . Our API will likely return something like:

    {
      "job_id": "...",
      "notebook": "Notebook Name.ipynb",
      "status": "running",
      "user": "alice",
      "submitted_at": "2025-03-05T15:00:00Z",
      "started_at": "2025-03-05T15:02:00Z",
      "instance_type": "t3.medium",
      "schedule_id": null,
      ...
    }

    The UI can refresh this to update status.

    Get Job Logs – GET /api/jobs/{job_id}/logs: Retrieve the accumulated log output for the job (text stream). The response can be plain text or JSON with log lines. If the job is still running, this could support long polling (not returning until new logs are available) or simply return what’s available so far. For a more interactive approach, as mentioned, we might not use this endpoint in foreground mode but rely on WebSockets. However, providing it is useful for background jobs or API clients. We will likely implement both: a WebSocket for live streaming and this REST endpoint for on-demand access. The logs returned are those stored in MongoDB (the server writes logs there continuously). Because the log can be large, we might support range queries (e.g., ?from_line=100) or pagination. For initial implementation, returning the full log (or the tail if it’s huge) should suffice, given moderate usage.

    Get Job Output – GET /api/jobs/{job_id}/output: Download or fetch the executed notebook or results of the job. Since outputs are stored in Mongo, this endpoint will fetch the output notebook document (likely the .ipynb file content or perhaps a converted format). We might allow the client to specify a format, e.g. ?format=ipynb (default) or ?format=html to get an HTML rendition. The UI could use this to display the final notebook in a viewer or allow download. In some systems like Jupyter Scheduler, after a job completes you can download the notebook or other artifacts​
    blog.jupyter.org
    . We will provide similar capability. If the output is stored in GridFS due to size, the server will stream it to the client.

    Cancel Job – POST /api/jobs/{job_id}/cancel (or DELETE /api/jobs/{job_id} with some convention): Cancel a running job. This will trigger the orchestrator to terminate the EC2 instance (and mark the job as canceled in the DB). We will ensure idempotency – canceling an already finished job does nothing, canceling a queued job prevents it from starting if possible. Databricks, for instance, has an API to cancel running job runs by run_id​
    chaosgenius.io
    . Our implementation will mirror that functionality. The response can simply confirm the cancel or return the updated status.

    Manage Schedules – (if schedules are implemented) Endpoints like DELETE /api/schedules/{id} to remove a schedule, PUT /api/schedules/{id} to update timing or notebook, etc. These allow users to manage their recurring jobs. The UI would list scheduled jobs (with next run time, last run status, etc.) and allow deletion or editing.

    Authentication – We will also have endpoints for auth if not using an external system: e.g., POST /api/auth/login for obtaining a token, POST /api/auth/logout, and possibly GET /api/users/me for session info. These might not be exposed to end-users if using a web UI that handles auth internally, but they are part of the API for clients.

User Interface: On top of the API, we’ll implement a web UI for ease of use. Key UI elements:

    Job Submission UI: A page or modal where a user can upload a notebook file or select one from a list (if notebooks are pre-registered), provide parameters (perhaps a form generated from the notebook’s parameters cell), and choose to run now or schedule later. They would hit “Run” and the UI calls POST /api/jobs. If foreground, it might then navigate to a live view.
    Live Job Console: For a running job, an interface similar to a console showing real-time logs. This could also show the notebook’s name, a stop button (cancel), and a status indicator. We could highlight errors in red if encountered. This live view would be powered by the WebSocket or by polling the logs endpoint.
    Job List and Detail: A dashboard listing past jobs (with filters for status: success, fail, running). Each entry clickable to view details (including the output notebook or logs). The detail view for a completed job would show final status, execution time, and provide a button to download the output or view it inline (we can embed an HTML version of the notebook for quick viewing).
    Schedule Management: A section where users can see their scheduled jobs (job definitions) – with info like schedule frequency, next run, last run result – and create or cancel schedules. Creating a schedule likely re-uses the job submission form with an added schedule field.

The UI will enforce the RBAC as well (hiding or disabling actions the user shouldn’t take), but the backend will ultimately check permissions on each API call too.

API Design Considerations: We will design the API to be RESTful and stateless. JSON will be used for request/response bodies (except maybe for file uploads/downloads where multipart or binary might be used). Consistent naming (use nouns like /jobs, /schedules). Versioning the API (e.g., prefix with /api/v1/) is wise for future updates. The API will return appropriate HTTP status codes (201 Created for job submission, 200 OK for gets, 401 Unauthorized for auth failures, 500 for server errors, etc.).

We should also consider rate limiting or protection on the APIs to prevent misuse (since job execution is heavy, we might limit how frequently a user can launch jobs or how many concurrent jobs they can have, configurable per role).

It’s worth noting that our approach aligns with patterns seen in other platforms. For example, Jupyter Scheduler (an official Jupyter project) provides a REST API to create and manage notebook jobs, including scheduling with cron, and stores job definitions in a database​
blog.jupyter.org
. And Databricks provides a Jobs REST API that allows programmatic submission, listing, and cancellation of jobs​
chaosgenius.io
​
chaosgenius.io
. We are essentially implementing similar endpoints tailored to our infrastructure. By adhering to these common patterns, we make the system easier to understand and potentially integrate with.
Role-Based Access Control (RBAC) and Security

User Authentication & Roles: The system will incorporate robust authentication and role-based access control to ensure that only authorized users can submit or view jobs, and that users can only access their own results (unless given permission). We will set up a user model with at least two roles: normal users and administrators. Normal users can submit notebooks and view/manage only their own jobs. Administrators (or perhaps specific roles like “job_manager”) can view and control all jobs in the system, and manage user accounts and system settings. The RBAC model might be extended to support team or project-based permissions if needed (but initially user-isolation and an admin role suffice).

Every API request will require authentication (except maybe a health check). We can implement JWT-based auth: users log in with a username/password (stored securely in the database with hashed passwords), and if credentials are valid, the server issues a JWT containing the user’s identity and role. The client (UI or scripts) supplies this token on subsequent requests (e.g., in the Authorization header). The server will verify the token and enforce access rules. Alternatively, we could use session cookies with server-stored sessions – but JWTs are more stateless and suitable for APIs.

Enforcing Access Control: The API server will check on each request what the user’s role is and what resource is being accessed:

    For job submission (POST /jobs), any authenticated user can submit a job (maybe administrators could have the ability to submit on behalf of another user, but we can skip that unless needed).
    For job status or log retrieval (GET /jobs/{id} or logs), the server will verify that the requesting user is either the owner of that job or an admin. If not, the server returns 403 Forbidden. This prevents users from snooping on others’ jobs.
    For listing jobs, a normal user will only get their jobs. An admin might get a parameter like ?user=alice or by default see all.
    For scheduling, similar rules: you can only manage your own schedules.
    Admin-only functions might include endpoints to manage users (create new users, assign roles) or to view system-wide metrics.

This approach follows the principle of least privilege. We will likely maintain a users collection in MongoDB with fields like username, password_hash, role, etc. For a production system, integration with an identity provider (LDAP, OAuth2, SAML SSO, etc.) could be considered, but implementing a basic internal auth is straightforward for now.

RBAC Implementation: If using Flask, we can use extensions like Flask-Login (for session management) combined with Flask-Principal or a simple decorator approach to enforce roles. For example, a decorator @requires_role('admin') could guard admin-only endpoints. Flask-JWT-Extended could help with JWT handling. In FastAPI, we can use OAuth2PasswordBearer and dependency injection to retrieve the current user and verify scopes/roles.

Importantly, the system will log security-relevant events: logins (success/failure), job submissions (with user info), and admin actions. This provides an audit trail in case of any issues.

Multi-Tenancy and Isolation: Because users can run arbitrary Python in their notebooks, isolating execution is vital. Running each job on its own EC2 VM is a big security advantage – it ensures that one user’s code cannot directly interfere with another’s or with the server. There is no shared memory or file system between jobs. Once the job is done, the VM is destroyed, cleaning up any processes or data left on it. This is analogous to how multi-tenant notebook services isolate users’ workloads (e.g., JupyterHub spawns separate servers per user, or systems use containers/VMs per job for security).

We will further ensure that the EC2 instances have limited network access. Typically, the instance only needs to communicate with the central server (to fetch the notebook and send results). We can place the instances in a private subnet where they cannot reach internal databases or services except what’s needed (e.g., allow egress to the MongoDB if it’s in the same VPC or a cloud service). If MongoDB is in a private network, we give the instance access to it strictly. If MongoDB is a cloud service (like MongoDB Atlas), we could restrict its network access to the specific IPs of our orchestrator or VPC. Alternatively, to avoid giving the instance DB credentials at all, we could have it return the results to the orchestrator (which then stores to DB), meaning the instance only calls an API on the server and doesn’t know the DB credentials. This is a design choice trading simplicity for a bit more security.

Data Security and Privacy: Since notebooks and their outputs may contain sensitive data, we will secure data at rest and in transit. MongoDB will be configured with authentication and, ideally, with encryption at rest. Connections to MongoDB will use SSL. The API will be served over HTTPS so that user credentials and data are encrypted in transit. Within AWS, data from the instance to the server or to Mongo can travel over a secure network (if within the same VPC or via TLS if going over the internet). Any temporary storage on the EC2 (like the input/output notebook files) resides on the instance’s disk which is ephemeral, but we might still want to use an encrypted AMI for the EC2 just in case.

Secret Management: The system will have to handle secrets like the MongoDB connection URI, and maybe AWS credentials if the orchestrator runs outside AWS environment. These will not be hard-coded; they’ll be stored in config files or environment variables on the server (which is itself secured). If using AWS parameter store or secrets manager, we could fetch them at runtime. For user passwords in our user database, we use strong hashing (bcrypt or Argon2) with salt – never store plaintext passwords. If integrating with an external IdP, we wouldn’t store passwords at all, just the identity tokens.

RBAC in UI Sharing: If the UI provides a way to share job results with others (e.g., generate a link to an output), it will respect RBAC. For instance, in Qubole’s notebook platform they allowed sharing output links only if the other user has appropriate RBAC permissions​
qubole.com
. We can implement something similar: perhaps an “share with user X” feature that gives that user read-access to a job’s output. But by default, only the owner (and admins) can see a job. In our initial design, we might not implement arbitrary sharing to keep it simple; the focus is ensuring no unauthorized access.

Administrative Controls: Admin users will have some special capabilities:

    View any user’s jobs (for support/troubleshooting).
    Possibly kill any job if it’s misbehaving or hogging resources.
    Manage system settings like default instance type or max concurrency.
    Manage user accounts (create new users, assign roles). We might include a simple user management UI or require direct DB edits for initial setup.

Auditing and Logging: The system will maintain logs of user actions. For example, the API server logs every job submission with which user initiated it, and any cancel actions. MongoDB can also log queries. We may store an audit trail in a separate collection or use a logging service. This is more operational, but important if the system is used by multiple people in an organization.

Finally, our RBAC approach is informed by the principle that “Role Based Access Control provides fine-grained control of access to resources”​
jupyterhub.readthedocs.io
in multi-user systems like JupyterHub and others. We identified that existing solutions like Notebooker lacked user isolation (all notebooks were accessible to any user with access to the interface)​
mljar.com
– we will not repeat that mistake. By implementing proper authentication and role checks in every request, we ensure that one user cannot view or interfere with another’s jobs or outputs. This keeps proprietary code and results safe within each user’s scope.
Storing Job Outputs in MongoDB

Instead of using AWS S3 to save notebook results (which is a common approach in cloud workflows), this design uses MongoDB as the storage backend for job outputs. Each job’s output – primarily the executed notebook file and associated logs or result artifacts – will be saved to MongoDB so that users can retrieve them via the API/UI.

What Gets Stored: For each job run, once execution finishes on the EC2 instance, we will have:

    The executed notebook (.ipynb) with all outputs embedded. This is a JSON document containing the code, text, and outputs (images are typically base64-encoded inside). This file can be quite large if there are many outputs or plots.
    The textual logs of the execution (which may overlap with some notebook outputs, but also include things like Papermill’s execution progress and any system messages). We might treat these logs separately for convenience.
    Possibly result files if the notebook saves external files (for example, a CSV or a trained model). However, handling arbitrary files is outside the core scope – if needed, those could also be stored in Mongo (GridFS) or a shared file system. For now, we assume the primary result is the notebook itself and its printed outputs.

We will design a MongoDB schema as follows:

    A collection jobs (or runs) where each document represents a job run. Key fields: _id (job ID), user_id, status, start_time, end_time, duration, error_message (if any), instance_type, etc. Additionally, we’ll have fields for output and logs, or references to them:
        output_nb – the executed notebook data. This could be stored inline as a BSON binary or JSON. If the notebook is very large (potentially >16MB, Mongo’s single document limit), we will instead use GridFS to store it (GridFS splits large files into chunks stored in two collections). We’d then store maybe an output_gridfs_id in the job document.
        logs – the text log of the run. If relatively small (say under a few hundred KB), we can store it as a string field or array of strings (lines). If large, we could also offload to GridFS or a separate job_logs collection where each log entry is a separate doc with a reference to job_id and maybe sequence number. For simplicity, storing the entire log text in the job document is acceptable initially.
        If using separate collections: We might have job_outputs collection storing the notebook file (with a reference key to job_id) and job_logs storing logs (with job_id). However, embedding in the jobs collection as sub-fields is convenient for one-stop access, as long as sizes are manageable.
    A collection schedules (if scheduling) storing schedule definitions (with fields like cron_expr, next_run, notebook_ref, etc.).
    A collection users for user auth as discussed, but focusing on outputs here.

Storing the Notebook File: We will gather the executed notebook from the EC2 instance after Papermill runs. This could be done by the instance itself pushing it (e.g., the instance could connect to MongoDB and insert the document). Alternatively, the instance could send it via an API request to the server (which then does the DB insert). Either way, the notebook’s JSON will be transmitted. Papermill by default saves the executed notebook to a file; we’ll need to read that file and send its content. Using PyMongo on the instance to insert directly into MongoDB is straightforward – we’d give the instance the Mongo connection URI (ensuring the credentials only have access to insert one specific job’s data). Direct DB write has the advantage of not requiring the orchestrator to handle file transfer, but it does couple the instance to the DB credentials. An API approach keeps the instance simpler (just send file over HTTP to the server). We can choose based on security preference. Let’s assume the orchestrator will handle final DB storage: it can fetch the output via SSM (e.g., run cat output.ipynb and capture it) or by having the instance upload the file to an S3 signed URL (though we want to avoid S3, the instance could send raw bytes over HTTP). To keep things contained, giving the instance limited DB access to insert the output might be okay if properly restricted to one operation.

Once the notebook JSON is in MongoDB, we may choose to also store a rendered HTML version. This is not strictly required, but it can speed up viewing in the UI (the UI could either render the JSON notebook client-side using something like nbviewer components, or the server can convert notebook to HTML using nbconvert and store that). If many plots or images, the HTML will also be large, but Mongo can store it as well. We might defer HTML generation to on-demand (i.e., when user wants to view, the server uses nbconvert to generate HTML from the JSON stored).

Why MongoDB: Using MongoDB for outputs offers some benefits:

    Single data store: All metadata and results reside together, which simplifies the architecture (no need to manage an S3 bucket or ensure its security). We can query the jobs and their outputs in one place. For example, one could query Mongo to find all jobs that had errors or to search outputs for a keyword.
    Flexibility: Notebooks are JSON; storing them in a JSON document database is natural. We don’t have to transform the data (except maybe minor cleaning). This plays well with the schemaless nature if notebook structures vary.
    Atomic updates: We can update the job document as it progresses (set status, add logs, then add output) in one DB. Using S3 for output would require combining DB (for status) and S3 (for file), whereas here we can potentially put everything in one doc (again being mindful of size).
    No external file management: We avoid the overhead of ensuring an S3 object’s lifecycle, permissions, and mapping between DB and S3. In Mongo, each job’s output is directly attached.

It’s worth noting that Papermill itself is designed to work with storage abstraction – it can store notebooks in S3, Azure, etc., via configurable “stores”​
papermill.readthedocs.io
. We’re essentially implementing a custom storage backend using MongoDB. We might not integrate at the Papermill config level, but conceptually it’s similar to Papermill writing to a remote store. (Papermill’s documentation mentions it can send final notebooks to AWS S3 or Azure blobs​
mljar.com
– instead of that, we send to Mongo.)

Handling Large Outputs: We anticipate that most notebooks (especially if they’re primarily code and numeric output) will be a few MB at most, which Mongo can handle easily. But some may include large embedded images or large data prints. For anything approaching or exceeding the 16MB BSON document limit, we will use MongoDB’s GridFS. GridFS allows storing files of any size by splitting into chunks (default 255KB each). We would then store the notebook in chunks and have an entry in a fs.files collection. The job document can reference the GridFS file by an ObjectId. When the user requests the output, the server will stream it from GridFS and reconstruct the notebook file.

Indexing and Querying: We will index important fields in the jobs collection, such as user_id (for listing a user’s jobs quickly) and status (if we want to find running jobs, etc.). We may also index schedule_id in jobs so we can link runs to a schedule. We likely won’t index the output content (that would be massive and unnecessary), but we might index a field like error_message or a boolean success to allow filtering successes vs failures. MongoDB full-text search on notebook content is not in scope, though possible if needed.

Storing Input Notebooks: Another consideration is storing the original input notebook (the code as it was run). If users frequently update their notebooks, it could be useful to keep a snapshot of the exact code that was executed for each run (for reproducibility and auditing). Jupyter Scheduler in JupyterLab does this – it “saves a copy of the input file, so that even if you later change the file, it captures the state of the notebook at the time your job ran”​
blog.jupyter.org
. We can adopt that practice. That means on job submission, we store the input notebook (perhaps also in Mongo or at least attach it to the job record). Then the output notebook is a separate file. This way, the job record includes both the code and results as they were at execution time. This is very helpful for debugging (“what code did you run that produced this output?”). It also enables rerunning or comparing later.

Example Document: A job document in MongoDB might look like:

{
  "_id": ObjectId("..."),
  "user": "alice",
  "notebook_name": "Data Analysis.ipynb",
  "status": "success",
  "submitted_at": ISODate("2025-03-05T15:00:00Z"),
  "started_at": ISODate("2025-03-05T15:02:00Z"),
  "ended_at": ISODate("2025-03-05T15:10:00Z"),
  "instance_type": "m5.xlarge",
  "parameters": {"input_path": "s3://bucket/data.csv"}, 
  "input_notebook": {/* (possibly stored here or in GridFS) */},
  "output_notebook": {/* executed notebook JSON or GridFS reference */},
  "log": "line1...\nline2...\n... full log text ...",
  "error": null
}

If the output_notebook is huge, it might instead have "output_nb_gridfs_id": ObjectId("...") and the actual data is in GridFS collections.

MongoDB Integration Setup: We will set up the MongoDB connection in the API server using a connection string from config (with credentials). The EC2 instances (if they push directly) will use a limited privilege account – possibly we create a MongoDB user that only has insert permission on the outputs collection. Alternatively, the API server acts as the single writer to the DB for outputs, so the instances talk back to it. Either approach, the goal is to secure the DB from unintended access.

We also plan to leverage MongoDB’s reliability features: if using a replica set or a managed service like MongoDB Atlas, the data will be replicated for durability. This ensures job outputs aren’t lost (which is important since we’re not keeping them on the instances or in S3 as a backup). Backup strategies for Mongo should be in place (periodic backups or point-in-time recovery if using Atlas, etc.) to safeguard against data loss, since this will contain possibly critical results.

In summary, using MongoDB to store outputs gives us a central, queryable repository of all job results. Users can immediately retrieve their notebook results via the UI/API without dealing with an external file store. This design follows patterns seen in other notebook job frameworks – for instance, the open-source Notebooker system also stores executed notebooks in MongoDB for sharing and viewing​
mljar.com
. We improve on such systems by ensuring each output is tied to user permissions. By keeping input and output notebooks, along with logs, we provide full traceability for each job run within the database.
Tools, Configurations, and Example Implementation Details

Finally, we outline some concrete tools, configurations, and open-source projects that will help implement this system, along with example setups for key components:

    Flask + Celery (or FastAPI) for Orchestration: We can implement the server using Flask due to its simplicity and the availability of extensions. For scheduling, the server can use Celery (with a message broker like Redis) to dispatch background tasks for notebook execution. However, since we offload execution to EC2, we might not need heavy task queues – the server mainly triggers AWS calls. Alternatively, Python’s APScheduler could be used to handle cron schedules within the Flask app. If using FastAPI, its async nature could be beneficial for handling multiple WebSocket log streams concurrently. Both frameworks are viable; Flask might integrate slightly more easily with a MongoDB backend via extensions. The open-source Notebooker uses Flask and could serve as a reference for the web application structure​
    mljar.com
    . (Notebooker lacks some features like RBAC and remote execution, but its scheduling and UI aspects are useful guides.)

    Papermill and nbconvert: We will use Papermill as discussed for executing notebooks. It’s a lightweight dependency (just a pip install papermill on the instance and orchestrator if needed)​
    dev.to
    . Papermill in turn uses nbclient/nbconvert under the hood to run the notebook. In case we need a backup or simpler execution method, we could use jupyter nbconvert --to notebook --execute command as well, which performs a similar function of executing a notebook and saving results. The MLJAR Studio blog on scheduling notebooks notes that “nbconvert can execute the notebook and save it in many formats (HTML/PDF/etc.), while Papermill is more advanced, allowing parameterization and sending final notebooks to external storage”​
    mljar.com
    ​
    mljar.com
    . Given we want parameter support and flexible storage, Papermill is the right choice. We’ll also include papermill’s parameters usage: users can specify notebook parameters on job submission, and Papermill will inject those (for example, a date range for a report). This makes our solution more powerful (similar to how Databricks jobs or Qubole allow parameterizing notebooks​
    qubole.com
    ).

    AWS Boto3 and SSM: On the orchestrator side, we will configure AWS credentials/permissions to allow instance management. A low-privilege IAM role/user with EC2 actions (RunInstances, TerminateInstances) and SSM actions (SendCommand, etc.) for our specific resources will be used. Boto3 usage is straightforward: we will prepare a function to launch an EC2 instance with given user-data. For SSM, we can use boto3.client('ssm').send_command(...) to run commands on the instance (the instance’s IAM role needs AmazonEC2RoleforSSM managed policy). We might, for example, send a command to run the notebook once the instance is ready, instead of using user-data. AWS Systems Manager also has features to copy files from the instance (SSM Session Manager’s receive-port or AWS-RunDocument to get output), which we could leverage for retrieving the output notebook file if not pushing directly.

    Configuration of EC2 Environment: We will likely create a custom AMI. Tools like HashiCorp Packer can automate AMI creation: we could write a Packer template that starts from an official Ubuntu AMI, installs Miniconda or Python 3, pip installs papermill, jupyter, pymongo (for Mongo access), and any frequently used data science libraries (pandas, numpy, etc. if needed by notebooks). This AMI ID would then be used in the orchestrator config. The AMI could also include a startup script or systemd service that registers with SSM (though that’s typically automatic with the SSM agent present). We will also configure the security group for these instances to allow outbound internet (for pip installs if needed and to contact our server or DB). If the orchestrator needs to SSH (in case we choose that route), we’d also attach a key pair and allow SSH from the orchestrator’s IP. However, using SSM is cleaner (no SSH ports required).

    CloudWatch Logs (Optional): Installing and configuring the CloudWatch Logs agent on the instance could provide another route for log streaming. The user-data could drop a CloudWatch agent config that tails /var/log/papermill.log and pushes to a CloudWatch Log Group. The orchestrator then can subscribe or pull from this log group in near-real-time. This decouples log collection from direct instance communication. However, since we are already storing logs in Mongo, this might be redundant. We might skip CloudWatch logs to avoid extra AWS dependencies, unless we find the need to debug infrastructure issues.

    Web Server and UI Setup: The Flask/FastAPI app can be hosted on an EC2 or container. For production, running it behind a reverse proxy (nginx) with SSL is recommended. We might use Gunicorn (WSGI server) for Flask or Uvicorn for FastAPI to serve it. The UI could be a single-page app built with React – in which case we’d separate frontend and backend. But to keep things simple and self-contained, we could use server-side rendering or a minimal HTML/JS that calls the API. For example, Flask with Jinja2 templates for pages, and using AJAX/Fetch for dynamic parts (like loading job logs). This avoids the need for a full separate frontend build. We can enhance the UI progressively (maybe add a polling or WebSocket JavaScript for logs). Using a component like xterm.js or similar could present logs nicely in the browser.

    Open-Source Tools/Projects for Reference: We have mentioned a few:
        Notebooker (Man Group) – provides scheduling and a UI for notebooks with Flask/MongoDB​
        mljar.com
        . We can inspect its code (on GitHub) for how it triggers notebook runs. Notebooker runs notebooks on the same server (not on EC2) and lacks auth, but its job scheduling (using cron) and conversion to PDF/email features are interesting.
        Jupyter Scheduler (JupyterLab extension) – demonstrates how to manage jobs definitions and outputs within Jupyter environment​
        blog.jupyter.org
        . It’s more of an extension rather than a standalone service, but the concepts overlap (it also uses Papermill under the hood).
        Mercury (mljar/mercury) – an open source framework (Django + React) that can schedule notebooks via a YAML config​
        mljar.com
        . It’s more for turning notebooks into apps, but it has a scheduling ability. Could inspire how to integrate schedule definitions.
        Airflow Papermill – Apache Airflow has a PapermillOperator (via the papermill provider package) that can run notebooks as tasks in a DAG. While we don’t need full Airflow, we might borrow ideas on how they handle execution and logging. (Airflow typically stores logs on disk/S3 and displays them in its UI, which is somewhat analogous to what we do with Mongo).
        AWS Step Functions / SageMaker – not open-source, but AWS’s approach uses Step Functions or SageMaker Pipelines to run notebooks in training jobs​
        aws.amazon.com
        ​
        aws.amazon.com
        . Ours is simpler (not full pipeline management), but we note that they treat a notebook job similarly to a batch training job in SageMaker​
        aws.amazon.com
        . We won’t directly use Step Functions here (to avoid AWS-only lock-in and because we want simple EC2 usage), but it’s a point of comparison.

    Example Config Files:

        AWS Config: We might have a YAML or JSON config for our orchestrator like:

aws_region: us-east-1
instance_ami: ami-0123456789abcdef0
instance_type: t3.medium
ssh_key_name: my-keypair   # if using SSH
iam_instance_profile: ec2-jupyter-jobs-role
security_group_ids: [sg-0123abcd]
subnet_id: subnet-0456def   # if in VPC

This can be loaded by the Python app to know how to launch instances.

App Config: A config for the Flask app:

MONGO_URI: mongodb+srv://user:pass@cluster0.mongodb.net/jobsdb
JWT_SECRET_KEY: "<some secret>"
ALLOWED_USERS: ["alice", "bob"]   # or user database

We would not actually list allowed users in config but manage via DB. Also config for scheduling, e.g., max concurrent jobs per user, default timeout (maybe 1 hour).

User Data Script Example: The user-data that runs on EC2 could be:

        #!/bin/bash
        set -e
        JOB_ID="${job_id}"        # passed via substitution
        MONGO_URI="${mongo_uri}"  # possibly passed (with limited user credentials)
        # Step 1: Fetch notebook content from API
        curl -H "Authorization: Bearer ${token}" "${orchestrator_url}/api/jobs/$JOB_ID/input" -o input.ipynb
        # Step 2: Execute notebook
        papermill input.ipynb output.ipynb ${parameters}
        EXEC_STATUS=$?
        # Step 3: If papermill failed, record status (perhaps prepare an error message)
        # Step 4: Send output notebook and logs back to server or DB
        python3 <<PYCODE
        import pymongo, bson.json_util
        client = pymongo.MongoClient("${MONGO_URI}")
        db = client.jobsdb
        with open("output.ipynb", "r") as f:
            output_data = f.read()
        db.jobs.update_one({"_id": bson.ObjectId("${job_oid}")},
                           {"$set": {"status": "success", "ended_at": datetime.utcnow(),
                                     "output_notebook": bson.json_util.loads(output_data)}} )
        PYCODE
        # Step 5: Shutdown instance
        shutdown -h now

        This pseudo-script illustrates one approach (in reality, we’d also handle errors, and possibly send logs similarly). In practice, we might not embed the entire notebook JSON in the update query due to size – using GridFS via PyMongo would be more appropriate for large files. Or if using an API, we’d POST the file in chunks.

        Logging Configuration: We will set Papermill to be verbose. Possibly create a papermill logging config that prints cell execution messages. The user-data or SSM command can redirect Papermill output to a file and also stream it. For example: papermill input.ipynb output.ipynb ${params} 2>&1 | tee papermill.log. Then papermill.log can be tailed by another process or read periodically.

    Testing the Workflow: We will test with a simple notebook (e.g., one that prints numbers with delays) to ensure the log streaming works and the output is stored correctly. We will also test scheduling by setting a short interval schedule and seeing if jobs trigger at the right times.

    Example Use Case: Suppose user "Alice" wants to run a heavy data analysis notebook. She develops it locally and then uses our system to run it on a beefy EC2 instance. She logs into the UI, uploads her notebook and sets some parameters, and hits "Run interactively". The UI calls our API, which launches an EC2 instance. Within a minute, logs start streaming: Alice sees messages that the data is loading, then that a model is training, etc. Half an hour later, the job finishes. The instance sends back the executed notebook which is saved in Mongo. Alice can now download the output notebook or view it in the browser; all plots and results are intact. She can also share the results with a colleague Bob by exporting the notebook or giving Bob access (if Bob has permissions on the system). Meanwhile, another user "Bob" schedules a nightly notebook to aggregate daily metrics. He sets it to run every midnight. The scheduler in our server kicks off an EC2 run each night, and next morning Bob can find the run in the UI with status and output ready – he didn’t need to keep any infrastructure running overnight except the lightweight scheduler.

    Maintenance and Extensibility: We plan for logs and outputs to accumulate in MongoDB. Over time, an admin might need to clean old records or archive them if space becomes an issue. We could provide a script or function to archive or prune jobs older than X days, perhaps exporting their outputs to another storage or just deleting them as policy permits. We’ll also monitor the EC2 usage – adding monitoring on the orchestrator to track if any instances are orphaned (in case of crashes, etc.). Since each job is tagged, a periodic cleanup script could terminate any instance that has a tag and is running beyond a certain time with no corresponding active job in DB (just as a safety net).

In conclusion, this solution brings together a familiar technology stack (Python/Flask, Papermill, MongoDB, AWS EC2) to implement a Databricks-like notebook job service. It emphasizes dynamic scaling (one VM per job), real-time interactivity, and secure multi-user operation. By referencing proven tools and patterns – from Papermill’s usage​
dev.to
to job scheduling APIs​
blog.jupyter.org
and multi-tenant log storage​
qubole.com
– we ensure the design is sound and implementable. The outlined plan covers all aspects from infrastructure to API design to security, providing a clear path to building the system. Each component can be developed and tested in isolation (e.g., first get a notebook to run on EC2 via Papermill, then integrate the API, etc.), making the implementation manageable. Once in place, data scientists can develop notebooks locally and rely on this service to execute them on-demand on AWS, with full tracking and without worrying about the underlying compute – achieving a similar user experience to running jobs on a managed platform, but using our custom, open solution.

Sources:

    Faethm AI – Scaling Jupyter notebooks with Papermill: Papermill executes notebooks, capturing all outputs in the resulting notebook​
    dev.to
    ​
    dev.to
    .
    Informatica – Ephemeral Cluster Strategy: Transient clusters are created for jobs and terminated afterwards to save costs​
    docs.informatica.com
    .
    Qubole Blog – Multi-tenant Logs for Ephemeral Clusters: Logs and history must be persisted outside ephemeral clusters so users can access them after the cluster is gone​
    qubole.com
    .
    Qubole – Scheduling Notebooks: Notebook jobs can be scheduled via UI or API using a scheduler, similar to our approach for recurring runs​
    qubole.com
    .
    Databricks Jobs API – Job Runs Management: Provides endpoints to list job runs and cancel runs programmatically​
    chaosgenius.io
    ​
    chaosgenius.io
    , which inspired our API design.
    Jupyter Blog – Jupyter Scheduler: Jupyter’s Scheduler extension uses a REST API and allows plugging in custom backends for running notebooks (e.g., on cloud)​
    blog.jupyter.org
    .
    MLJAR Studio – Notebooker (Flask+MongoDB): Notebooker is an open-source Flask app with MongoDB for scheduling notebooks and sharing outputs (though without RBAC)​
    mljar.com
    ​
    mljar.com
    .
    Qubole – Parameterized Notebooks: Notebooks can be parameterized for different runs (Qubole leverages Papermill for this)​
    qubole.com
    .
    AWS Machine Learning Blog – Use Cases for Notebook Jobs: Running long notebooks in background, scheduling regular jobs, etc., are common scenarios addressed by notebook jobs​
    aws.amazon.com
    .
    JupyterLab Scheduler – Output Management: Scheduler saves a copy of the input notebook and uses unique names for each run’s output to ensure reproducibility​
    blog.jupyter.org
    .