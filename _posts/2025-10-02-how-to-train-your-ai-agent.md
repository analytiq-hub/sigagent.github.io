---
layout: post
title: "How To Train Your AI Agent"
date: 2025-10-02
author: Andrei Radulescu-Banu
categories: [ai, programming, tutorials]
---

There are two separate problems:
- Creating the AI Agent 
- Tuning the AI Agent to solve the specific problem you are targetting - whether it is a fully automated agent, or one requiring human-in-the-loop intervention.

These two problems have evolved to be separate, and to requie different techniques.

Creating an AI agent is an infrastructure task, and it is best for this infrastructure to be generic - so the tuning phase does not depend on specific choices made during the agent creation.

Also, while an AI agent infrastructure could be created from scratch, a number of frameworks have become available to provide more or less ready-made AI agent infrastructure.

Comparatively, tuning the agent is very specific to the task at hand - i.e., to what the agent needs to solve.

Often, an AI Agent project is started when the precise specification of the task, or its specific sub-tasks, are not fully known. 

## __The Infrastructure__: Creating the AI Agent

Our infrastructure of choice, at the time of the writing of this post, is [__Claude Code__](https://docs.claude.com/en/docs/claude-code/overview), which also has an available [__Claude Agent SDK__](https://www.anthropic.com/engineering/building-agents-with-the-claude-agent-sdk)

Features supported:
* Subcommands
* Subagents
* MCP server - used for extending the set of available tools

The agent needs a knowledge base. This is not provided standard with the Claude Agent SDK, and needs to be manually built.

Our choice for vector DB is __Pinecone__, for the simplicity and ready-availability of the SAAS platform. Multiple other open source options are available for vector DB: __Weaviate__, __Qdrant__, __ChromaDB__. Most relational or text databases now support vector DB tables or collections (__Postgres__, __MongoDB__).

