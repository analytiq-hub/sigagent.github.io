---
layout: default
title: "Talks - Analytiq Hub"
permalink: /talks/
---

<div class="max-w-6xl mx-auto px-4 sm:px-6 md:px-8 py-4 md:py-12">
    <!-- Header -->
    <header class="mb-12 pb-8 border-b border-gray-200">
        <p class="text-gray-600 text-xl leading-relaxed">
            Speaking engagements and public presentations on AI
        </p>
    </header>

    <main>
        <!-- Talks Container -->
        <div class="space-y-8" id="talks-container">
            {% include talk-card.html 
                title="How To Integrate Stripe Into Your AI Application"
                speaker="Andrei Radulescu-Banu"
                date="Oct 24, 2025"
                event="AI Tinkerers"
                event_url="https://boston.aitinkerers.org/"
                logos="/assets/images/aitinkerers-1.png"
                image="/assets/images/how_to_integrate_stripe.png"
                links="https://boston.aitinkerers.org/p/ai-tinkerers-boston-meetup-october-2025;Event Details|https://www.linkedin.com/feed/update/urn:li:activity:7387836092588240896/;LinkedIn Post|/tech/programming/ai/tutorials/how-we-integrated-stripe-into-docrouter-ai/;Blog Post"
                abstract="How did we built Stripe billing into DocRouter.AI? The talk covered why Stripe was the right choice for scaling metered AI usage, our SPU (Service Processing Units) credit system inspired by Databricks DBUs, free tier → plans → a-la-carte credits with consumption waterfall, dynamic pricing config 100% in Stripe metadata, async Stripe API calls in FastAPI, and our MongoDB backend schema."
            %}

            {% include talk-card.html 
                title="How To Train Your AI Agent"
                speaker="Andrei Radulescu-Banu"
                date="Oct 15, 2025"
                event="AI Camp"
                event_url="https://www.aicamp.ai/event/eventdetails/W2024072614"
                logos="/assets/images/ai-camp.png"
                image="/assets/images/how_to_train_your_ai_agent.png"
                links="https://www.aicamp.ai/event/eventdetails/W2025101515;Event Details|https://docs.google.com/presentation/d/1GFcD4bruJBJPFeJkPp_K-MfkU8ZrHtgfrV7WoLumKd4;Slides|https://www.linkedin.com/feed/update/urn:li:activity:7384733807968526337/;LinkedIn Post|https://www.linkedin.com/feed/update/urn%3Ali%3Aactivity%3A7384621615977820160/;LinkedIn Post|https://www.linkedin.com/feed/update/urn:li:activity:7383136087935832064/;LinkedIn Post|https://www.linkedin.com/feed/update/urn:li:activity:7384566447072616448/;LinkedIn Post"
                abstract="What are the steps to create an AI Agent? Our AI Camp talk is a deep-dive into how AI Agents are implemented, in practice. With lessons learned from our DocRouter.AI coding agent, and our consulting engagement implementing a coding agent for lab information management systems company Starlims."
            %}

            {% include talk-card.html 
                title="Engineering with Guardrails: Innovating in Regulated Spaces"
                speaker="Ilsa Webeck, Andrei Radulescu-Banu, Marjan Monfared"
                date="September 9, 2025"
                event="Startup Boston Week 2025"
                event_url="https://sbw2025.sched.com/event/264KN/engineering-with-guardrails-innovating-in-regulated-spaces"
                logos="/assets/images/startup_boston_week.png"
                image="/assets/images/engineering_with_guardrails.png"
                links="https://sbw2025.sched.com/event/264KN/engineering-with-guardrails-innovating-in-regulated-spaces;Event Details|https://www.linkedin.com/pulse/navigating-compliance-startups-guide-regulated-andrei-radulescu-banu-jvnpe/?trackingId=vRI2OmOOSBqVGIijBp2OvQ%3D%3D;Blog Post|https://streamyard.com/watch/GWAw3FHAfUZy;Recording|https://www.linkedin.com/feed/update/urn:li:activity:7371516401406124032/;LinkedIn Post"
                abstract="<p>Building fast doesn’t mean ignoring the rules—especially in healthcare, fintech, AI, or consumer hardware. Our panel explores how to embed compliance into the development process without slowing innovation - for CTOs, technical founders, and engineering leaders operating in regulated industries.</p>
                Moderated by Rabeeh Majidi."
            %}
            
            {% include talk-card.html 
                title="GradeAssist AI: A School Quiz Grader"
                speaker="Andrei Radulescu-Banu"
                date="May 21, 2025"
                event="AI Tinkerers"
                event_url="https://boston.aitinkerers.org/talks/rsvp_9vvWQ2XeaSc"
                logos="/assets/images/aitinkerers-1.png"
                image="/assets/images/talk-gradeassist.jpg"
                abstract="GradeAssist is a new tool for teachers, using AI to grade open-form school quizzes, with teacher-in-the-loop – using <a href='https://www.linkedin.com/company/docrouter/' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>DocRouter</a> as an AI middleware, with a new front-end UI generated by Bolt AI."
                links="https://boston.aitinkerers.org/talks/rsvp_9vvWQ2XeaSc;Event Details|https://www.linkedin.com/feed/update/urn:li:activity:7331067862704402432/;LinkedIn Post"
            %}

            {% include talk-card.html 
                title="An AI Backbone for Document Processing"
                speaker="Andrei Radulescu-Banu"
                date="May 9, 2025"
                event="Mindstone Boston"
                logos="/assets/images/mindstonehq_logo.jpg"
                image="/assets/images/talk-ai-backbone-doc-processing.jpg"
                abstract="At the <a href='https://www.linkedin.com/company/sundaiclub/' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>Sundai</a> MIT hackathon, we recently develop a flow that grades 5th grade quizzes against a configured rubric. <a href='http://DocRouter.AI' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>DocRouter.AI</a> implements the back end, with the teacher-in-the-loop able to correct the evaluations. We reviewed this hack!<br><br>A front-end UI specialized for this use case can be quickly developed with tools like Manus, Bolt AI, Cursor, Windsurf. The DocRouter is the a tech stack accelerator, just managing prompts and evaluations, with human-in-the loop, hiding the complexity of LLM workflows."
                links="https://community.mindstone.com/annotate/article_AuDOhLA5awWaoXV98L;Recording with Transcript|https://docs.google.com/presentation/d/18SrBsdJrV9LC6-wlRLZ9p8COGKyhjB-JrmVr4bHZ6zk/edit#slide=id.g31c1d6a1bb0_3_0;Presentation Slides"
            %}

            {% include talk-card.html 
                title="AI Document Workflows"
                speaker="Andrei Radulescu-Banu"
                date="April 28, 2025"
                event="AI Tinkerers & CarGURUS"
                logos="/assets/images/aitinkerers-1.png,/assets/images/cargurus.png"
                image="/assets/images/talk-ai-workflows.jpg"
                abstract="<a href='https://docrouter.ai/' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>DocRouter.AI</a> is a drag-and-drop UI that transforms unstructured docs into ERP data – integrated with MCP clients like Claude Desktop – building web dashboards, dynamically – for example, allowing consulting companies to optimize internal engineering resources allocated to contracted projects."
                links="https://www.linkedin.com/feed/update/urn:li:activity:7323312770257481728/;LinkedIn Post"
            %}

            {% include talk-card.html 
                title="Smart Document Router"
                speaker="Andrei Radulescu-Banu"
                date="February 26, 2025"
                event="PyData Boston & MODERNA"
                logos="/assets/images/boston_pydata.png,/assets/images/moderna.png"
                image="/assets/images/talk-docrouter-pydata-moderna.jpg"
                abstract="The <a href='https://docrouter.ai/' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>DocRouter.AI</a> is an <a href='https://docs.google.com/presentation/d/14nAjSmZA1WGViqSk5IZuzggSuJZQPYrwTGsPjO6FPfU' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>open source</a> Document Understanding Tool. It performs data extraction, at scale, for intelligent automation in a number of verticals: Supply Chain, Healthcare, Finance.<br><br>It is implemented using:<br>– NextJS, NextAuth, TailwindCSS<br>– FastAPI, Pydantic<br>– AWS, MongoDB<br>– LiteLLM<br>– OpenAI, Anthropic, Gemini, Groq/DeepSeek<br><br>To Andrei's surprise, the <a href='https://www.cursor.com/' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>Cursor</a> AI editor wrote most of the <a href='https://docrouter.ai/' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>DocRouter.AI</a> code! We discussed how <a href='https://docrouter.ai/' target='_blank' rel='noopener noreferrer' class='text-blue-600 hover:text-blue-800'>DocRouter.AI</a> was coded."
                links="https://www.youtube.com/watch?v=dVro-Z6SDxU;Recording|https://docs.google.com/presentation/d/14nAjSmZA1WGViqSk5IZuzggSuJZQPYrwTGsPjO6FPfU;PyData Smart Document Router Presentation|https://www.linkedin.com/posts/benjamin-batorsky_pydata-bostons-february-event-another-smashing-activity-7300998869515935745-4nJ9;LinkedIn Post"
            %}

            {% include talk-card.html 
                title="Coding With AI"
                speaker="Andrei Radulescu-Banu"
                date="October 30, 2024"
                event="AI CAMP & VERACODE"
                event_url="https://www.aicamp.ai/event/eventdetails/W2024092514"
                logos="/assets/images/ai-camp.png,/assets/images/veracode.png"
                image="/assets/images/talk-coding-ai-camp.png"
                abstract="A practical look at writing software with AI tools: Scripting Claude.AI, Using the Cline VsCode add-on (open source), Using Cursor"
                links="https://www.youtube.com/watch?v=r9Q18X-Ko4Q;Watch Recording|https://docs.google.com/presentation/d/1_Urn3qlczQ9DtF3bDyGUl1_B0q7-Kwe37m5cpR53oOU/edit#slide=id.g1efc3f84a80_0_21;Coding With AI Slides"
            %}

            {% include talk-card.html 
                title="AI Human-in-the-Loop Panel"
                speaker="Andrei Radulescu-Banu, Dipali Trivedi, Brian Benedict"
                date="September 24, 2024"
                event="AI Furnace & Aethos"
                image="/assets/images/talk-human-loop.png"
                abstract="Panel discussion on how human-in-the-loop is implemented in practice, when used during LLM development vs in end products, LLM model evaluation, and the importance of humans understanding AI-generated code. Moderated by Nico van Wijk."
                links="https://www.linkedin.com/feed/update/urn:li:activity:7244538705946771456/;Andrei's Blog Post"
            %}

            {% include talk-card.html 
                title="HackMIT 2024"
                speaker="Panel Judge & Mentor"
                date="September 14, 2024"
                event="MIT"
                event_url="https://hackmit.org/"
                logos="/assets/images/mit-logo.png"
                image="/assets/images/talk-hackmit.jpg"
                abstract="Panel judge and mentor at HackMIT 2024, working with students on innovative AI and technology projects."
                links="https://hackmit.org/;HackMIT Website|https://www.linkedin.com/pulse/my-notes-from-hackmit-24-andrei-radulescu-banu-oluee/;Andrei's Blog Post"
            %}

            {% include talk-card.html 
                title="LLM Orchestration At Scale"
                speaker="Andrei Radulescu-Banu"
                date="July 26, 2024"
                event="AI Camp"
                event_url="https://www.aicamp.ai/event/eventdetails/W2024072614"
                logos="/assets/images/ai-camp.png"
                image="/assets/images/talk-llm-orchestration-ai-camp.png"
                abstract="Why do we need to orchestrate Large Language Models (LLMs)? We will talk about Perplexity.AI's approach, shared openly in their podcasts – and at enterprise workflow automation with unstructured data at scale."
                links="https://www.aicamp.ai/event/eventdetails/W2024072614;Event Details"
            %}

            {% include talk-card.html 
                title="How To Build A Self-Driving Car – A Look at Robotics System Design"
                speaker="Andrei Radulescu-Banu"
                date="February 21, 2024"
                event="AI Camp"
                event_url="https://www.aicamp.ai/event/eventdetails/W2024022114"
                logos="/assets/images/ai-camp.png"
                image="/assets/images/talk-self-driving.png"
                abstract="Sensors, control, planner, perception, mapping – how is a self-driving car built? An introduction for general engineering audiences, zeroing in on the integration of ROS (Robot Operating System) and system design principles in constructing autonomous vehicles."
                links="https://docs.google.com/presentation/d/1zl9OxqveTH6ASSh2oFmGDQUA-CwMWr-D6tjHNFMAnvs;How to Make a Self-Driving Car|https://www.aicamp.ai/event/eventdetails/W2024022114;Event Details"
            %}

            {% include talk-card.html 
                title="Using LLMs and NLP for Digital Health Automation"
                speaker="Andrei Radulescu-Banu"
                date="January 31, 2024"
                event="AI Camp"
                event_url="https://www.aicamp.ai/event/eventdetails/W2024013114"
                logos="/assets/images/ai-camp.png"
                image="/assets/images/talk-digital-health-ai-camp.png"
                abstract="Review of Large Language Models (LLMs) and Natural Language Processing (NLP) applications for business process automation in digital health: Nurse doing pre-op patient screening; and Insurance Claims Processing Automation"
                links="https://www.aicamp.ai/event/eventdetails/W2024013114;Event Details"
            %}

        </div>
    </main>
</div>