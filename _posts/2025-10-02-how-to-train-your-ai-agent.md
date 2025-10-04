---
layout: post
title: "How To Train Your AI Agent"
date: 2025-10-02
author: Andrei Radulescu-Banu
image: /assets/images/how_to_train_your_ai_agent.png
categories: [ai, programming, tutorials]
---

Developing an AI agent comes down to a number of intertwined yet distinct challenges:
1. Creating the __runtime infrastructure__ for the agent itself
2. __Planning__: Making agent tackle the __specific problem__ you're aiming to solve
3. Creating a __knowledge base__ the agent can use to inform its execution steps
4. Setting up an __evaluation infrastructure__ to track progress and catch agent mistakes
5. __Integrating__ the agent into the larger application

Whether the AI agent is __fully autonomous__ or works with __human-in-the-loop__ oversight, development includes roughly the steps outlined above. Each step calls for its own set of techniques and tools.

## Examples: Windsurf, Cursor and Claude Code

Let's start with some examples the reader may be familiar: 
* AI Editors like __Windsurf__, __Cursor__, __Github Copilot__
* Command line tools like __Claude Code__. 

The latter, __Claude Code__, also has a __VSCode__ extension by the same name.

In each case, the underlying AI agents are integrated with the text editor (our __Step 5__). 

While __Windsurf__, __Cursor__ and __Claude Code__ each have their own agent infrastructure (our __Step 1__), the latter, __Claude Code__ is different in that it is available as a __command line tool__ which can be executed as a standalone, in interactive or non-interactive mode. 

__Anthropic__ has also developed a __Claude Agent SDK__, with __Typescript__, __Python__ and __shell command__ flavors. The __Claude Agent SDK__ can be used for coding tasks, but also for more general tasks - for example, for document processing, or for support message processing, or for marketing reasearch and outreach.

An Agent SDK is not available for __Windsurf__ or __Claude Code__.

The __knowledge base__ (__Step 3__) for these agents is embedded into the language models themselves. These coding agents are required to understand and code in programming languages like __Python__, __Typescript__, __C__, __C++__ or __Java__. The language models are trained on these programming languges. 

While these agents do not technically require an external __knowledge base__, they use a __web search__ tool to look up product documentation, when implementing __coding tasks__.

 __Windsurf__, __Cursor__, __Github Copilot__ use multiple-vendor language models, in addition to models used in-house. __Claude Code__ on the other hand, only uses __Anthropic__ language models.

Custom AI Agents, though, will often need an __external knowledge base__, adapted to the task at hand (__Step 3__).

__Windsurf__, __Cursor__, __Github Copilot__ also use a __tab-completion__ model, which employs a smaller LLM acting directly in the editor buffer. __Claude Code__ does not have that feature.

The approach each of these AI editors takes during their __coding task__ is proprietary, and slightly different (our __Step 2__). Each, however, supports extending its functionality through __MCP Server__ support, allowing the editor, for example, to read external Github repositories through __MCP__.

Custom AI agents, however, need to implement their own __problem-solving mechanism__

Evaluation for these AI editors is also proprietary (__Step 4__). Custom AI Agents would need their own evaluation infrastructure developed from scratch.

## Separation of concerns: Infrastructure vs. Task-Specific Planning

When it comes to building the agent, we separate out the __Infrastructure__ design from the __Task Planning__, for a couple of reasons:
- Often times, the __task__ solved by the agent needs to be flexible and can change in the product lifecycle. This calls for __infrastructure__ to be separated out from the __task customization__. Sometimes, the __task__ or its __subtasks__ are not even fully known or understood at the outset of the AI Agent project.
- The __infrastructure__ is now available ready-made, and may not have to be built from scratch.

Adopting a ready-made, battle tested __AI Agent Infrastructure__ that is __steerable__ for your task will accelerate your AI Agent design.

## The AI Agent Infrastructure

As of this writing, our go-to stack for agent creation is the [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) shell command, complemented by the [Claude Agent SDK](https://www.anthropic.com/engineering/building-agents-with-the-claude-agent-sdk). Its advangates:
- A suite of powerful features like __CLAUDE.md__ customization, __subcommands__ for modular execution, __subagents__ for hierarchical delegation
- __MCP server support__, which lets you seamlessly extend the agent, and steer it to solve the __task__ at hand.

No agent is complete without a solid knowledge base, though—and the SDK doesn't ship with one out of the box. You'll need to craft this yourself. For the vector database powering it, we've settled on Pinecone, prized for its straightforward SaaS model that gets you up and running without fuss. That said, the open-source landscape is rich with alternatives: Weaviate, Qdrant, or ChromaDB, to name a few. Even traditional players like Postgres or MongoDB have jumped on the vector bandwagon, now offering built-in support for vector tables or collections.

In our architecture, we centralize all custom interfaces for the agent within the MCP server. This choice boosts portability across setups. Naturally, the MCP server includes a `vector_db_lookup()` interface to bridge the agent with its knowledge reservoir.

## Indexing Your Knowledge Base

Once you've got your knowledge base in place—say, tucked away in a MongoDB collection or an S3 bucket—it's time to make it searchable. Enter the indexing tool: it runs on a schedule, scanning the base for updates, intelligently chunking the content, and pushing those embeddings into a dedicated Pinecone index. We designed this to be fully idempotent, meaning it only acts on changes. Existing chunks in the vector DB? They're left untouched, no duplicates cluttering things up.

## Tuning via the MCP Server

With infrastructure humming, tuning shifts focus to the MCP server, where you craft interfaces laser-targeted at your task. Picture this workflow: A user drops in with a chat query, perhaps attaching files ripe for processing. For coding gigs, they might simply point to the files needing tweaks or a fresh start.

Enter CLAUDE.md, your agent's North Star document. It spells out how to forge a plan of action—detailing the sequence of steps and flagging which tools will likely shine in each one.

From there, the agent marches forward, step by step. It can go solo or pause for human nods, calling on MCP tools as needed to birth new files, refine existing ones, or query the knowledge base. These tools are built to handle reads and writes in formats the agent digests effortlessly.

Tuning isn't a one-and-done; it's an iterative dance. To gauge your progress and spot weak spots, rigorous evaluation becomes your compass.

## Putting It to the Test: Evaluation

Kick things off by assembling a ground-truth dataset—a curated set of benchmark problems mirroring real-world scenarios. Your evaluation script then takes the reins: For each item, it spins up a fresh Claude Code instance to tackle the problem in pure automated mode, sans user meddling. Once the output lands, a second forked instance steps in as the impartial judge, scoring it against the expected ground truth.

The metrics we track paint a full picture:
- Overall accuracy: How spot-on are the results?
- Completeness: Does it cover all bases without omissions?
- For MCP interfaces leaning on vector DB retrieval: Accuracy and completeness of the chunks pulled back.
- Drilling deeper, for select MCP tools: Per-tool breakdowns of response accuracy and completeness.
- And if ToDos are in play: How thoroughly were they checked off?

## Bringing Eval to Life: Visualization

Raw eval logs? They're a thicket—human eyes glaze over parsing them. Visualization turns that fog into clarity. We layer in:
- A quick-scan table, one row per question, for instant overviews.
- A radar chart aggregating metrics into a visual story of strengths and gaps.
- Distributions to reveal patterns across the board.
- Per-question deep dives on tool usage: At-a-glance summaries of which tools fired, what inputs they took, the outputs they spat, and any ToDo progress where relevant.

## The Rhythm of Iteration

Here's how the development loop flows in practice:
- Bootstrap your ground-truth dataset with straightforward questions to get baseline momentum.
- Fire up the evaluation suite and scrutinize the metrics—zero in on the ones falling short.
- For each shortfall, triage the root cause: Does the knowledge base crave fresh entries? Should chunking, indexing, or retrieval get a polish? Is an MCP tool buggy and begging for a fix—or outright absent, demanding invention? Or perhaps CLAUDE.md itself needs a refresh to better guide the agent?

This cycle isn't linear; it's a spiral upward, refining your agent into a precision instrument tailored to the task. Whether you're automating workflows or prototyping wild ideas, embracing this structured yet flexible approach keeps the project on track—and the breakthroughs coming.