---
title: "FastAPI Background"
categories: webdev
author: Andrei Radulescu-Banu
layout: post
---

#### FastAPI Background Jobs Needed
I needed my FastAPI backend to spawn background jobs, for example, to run OCR, Named Entity Recognition, or Large Language Mode orchestration. The FastAPI ran as an Api service to a NextJS front end React application. The details of the front end don't matter here.

The system already used a MongoDB database.

What options would be available, in this case, for background jobs? These jobs could take anywhere between a few seconds and a minute to complete.

#### Queues implemented on top of MongoDB

My plan was to implement a queue system in MongoDB, so I can post requests for background work to the queue from FastAPI, when a REST API is called. Whether I used a background thread, or background process, the plan was to read the work request from the queue, and process it.

Two options became available, and the purpose of this post is to describe them in a bit of detail:
* Background handled as coroutines in the FastAPI. This should work when, later, I distribute the FastAPI across multiple processes, deployed to ECS or Kubernetes.
* Background is handled through its own process. This should support multiple processes scaled up and down part of a process pool.

#### Option 1: Background Jobs as Coroutines in FastAPI

This approach involves using asynchronous programming within your FastAPI application to handle background tasks. Here are the key points:

1. Use FastAPI's BackgroundTasks feature to queue jobs.

2. Implement a worker coroutine that continuously checks the MongoDB queue for new jobs.

3. Use asyncio to manage concurrent execution of background tasks.

Pros:
* Simpler setup, as it's integrated within your FastAPI application.
* Easier to share resources and state with the main application.

Cons:
* May not scale as well for very long-running tasks.
* Could potentially impact the performance of your main API if not managed carefully.
* Harder to distribute across multiple processes or machines.

Here's a basic implementation:

```python
from fastapi import FastAPI
from motor.motor_asyncio import AsyncIOMotorClient
from datetime import datetime

app = FastAPI()
client = AsyncIOMotorClient("mongodb://localhost:27017")
db = client.your_database
queue_collection = db.job_queue

@app.post("/submit_job")
async def submit_job():
    job_id = await queue_collection.insert_one({
        "status": "pending",
        "created_at": datetime.utcnow(),
        # Add other job details here
    }).inserted_id
    return {"job_id": str(job_id)}
```

#### Option 2: Separate Background Process

This approach involves creating a separate process or service to handle background jobs. Here's how it could work:

1. Implement a separate Python script that acts as a worker process.

2. Use a robust task queue system like Celery or RQ, or implement your own using MongoDB.

3. The FastAPI application enqueues jobs, and the worker process(es) dequeue and process them.

Pros:
* Better isolation between API and background tasks.
* Easier to scale horizontally by adding more worker processes.
* Can be distributed across multiple machines more easily.

Cons:
* More complex setup and deployment.
* Requires additional infrastructure for task queue management.

Here's a basic implementation using a custom worker process:

Worker process (worker.py):

To run this setup, you would start your FastAPI application as usual, and then start one or more worker processes using python worker.py.
Recommendation:
Given your requirements, especially the need to distribute across multiple processes when deployed to ECS or Kubernetes, I recommend going with Option 2: Separate Background Process.
This approach will give you more flexibility in scaling and managing your background jobs independently of your API service. It also aligns well with containerized deployments, where you can have separate containers for your API and your workers.
To implement this:
Use your MongoDB queue as planned.
Implement the worker process as shown above.
When deploying, you can scale your API and worker containers independently based on load.
Consider using a process manager like Supervisor or Docker's built-in restart policies to ensure your worker processes stay running.
This approach will allow you to handle long-running tasks like Textract processing without impacting your API performance, and it will scale well as your application grows.
In option 2, can I have multiple worker processes set up simultaneously? Will find_one_and_update() guarantee that only one worker picks up the job?

Final Context in Folder
Yes, you can definitely have multiple worker processes set up simultaneously in option 2. This is one of the key advantages of this approach, as it allows for better scalability and parallel processing of jobs.
Regarding your question about find_one_and_update(), it does indeed provide a level of guarantee that only one worker will pick up a specific job. This is because the operation is atomic, meaning it's executed as a single, indivisible unit. Here's how it works:
The find_one_and_update() operation atomically finds a document matching the query criteria and updates it.
If multiple workers are trying to get a job at the same time, only one will successfully update the document and receive it as a result.
The others will get None (or null) as a result, indicating that no document was found matching the criteria (because it was already updated by another worker).
Let's look at the relevant part of the worker code:
In this code, the find_one_and_update() operation is used to atomically find a job with "pending" status and update its status to "processing". This ensures that even if multiple worker processes are running simultaneously, each job will only be processed by one worker.
To set up multiple worker processes, you could:
Run multiple instances of your worker script.
Use a process manager like Supervisor to manage multiple worker processes.
3. In a containerized environment (like Kubernetes), deploy multiple pods running the worker script.
Here's an example of how you might modify the worker script to allow for easy scaling:
In this modified version:
We've added a worker identifier (using the process ID) to the job document when it's picked up. This can help with debugging and monitoring.
The process_job function now prints which worker is processing the job.
You can run multiple instances of this script, and each will operate independently, picking up jobs as they become available. The find_one_and_update() operation ensures that each job is only processed by one worker, even when multiple workers are running simultaneously.

