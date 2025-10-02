---
layout: post
title: "How To Train Your AI Agent"
date: 2025-10-02
author: Andrei Radulescu-Banu
image: /assets/images/how_to_train_your_ai_agent.png
categories: [ai, programming, tutorials]
---

Developing an AI agent isn't a monolithic task—it's two intertwined yet distinct challenges: first, creating the foundational infrastructure for the agent itself, and second, fine-tuning it to tackle the specific problem you're aiming to solve. This could range from a fully autonomous system to one that thrives with human-in-the-loop oversight. Over time, these phases have naturally evolved into separate endeavors, each calling for its own set of techniques and tools.

When it comes to building the agent, think of it as laying down a robust infrastructure. The key here is to keep things generic and modular, ensuring that the later tuning process isn't shackled by early decisions. Sure, you could roll your own from the ground up, but why reinvent the wheel when a slew of frameworks now deliver battle-tested, more-or-less ready-to-deploy AI agent infrastructures?

On the flip side, tuning the agent is where things get intimately personal to your use case—it's all about adapting to the exact nuances of what the agent needs to accomplish. Interestingly, many AI agent projects kick off precisely because the full scope of the task, or even its sub-tasks, isn't crystal clear from the start. This uncertainty makes the process iterative and exploratory, which is part of the fun (and frustration).

## Building the Infrastructure: Creating Your AI Agent

As of this writing, our go-to stack for agent creation is [Claude Code](https://docs.claude.com/en/docs/claude-code/overview), complemented beautifully by the [Claude Agent SDK](https://www.anthropic.com/engineering/building-agents-with-the-claude-agent-sdk). What draws us to it? A suite of powerful features like subcommands for modular execution, subagents for hierarchical delegation, and an MCP server that lets you seamlessly extend the agent's toolkit.

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