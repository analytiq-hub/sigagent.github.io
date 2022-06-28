---
layout: page
title: Engineering Skills
mathjax: true
---

#### Coding Sites
* [CoderPad](https://coderpad.io)
* [InterviewBit](https://www.interviewbit.com)
* [LeetCode](https://leetcode.com)

#### Books
* Alex Xu: [System Design Interview – An insider's guide](https://www.amazon.com/System-Design-Interview-insiders-Second/dp/B08CMF2CQF)
* M. Kleppmann: [Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems](https://www.amazon.com/Designing-Data-Intensive-Applications-Reliable-Maintainable/dp/1449373321)
* W. Larson: [Staff Engineer: Leadership beyond the management track](https://www.amazon.com/Staff-Engineer-Leadership-beyond-management-ebook/dp/B08RMSHYGG)

#### Talks
* H. Fisk: [Large-Scale Low-Latency Storage for the Social Network](https://www.youtube.com/watch?v=5RfFhMwRAic) (2013)

#### Algorithms - YouTube Presentations
* [Graph Algorithms for Technical Interviews](https://www.youtube.com/watch?v=tWVWeAqZ0WU)
  * Use vertex adjacency list.
  * Breadth-, depth-first graph traversal. Use stack vs queue of unvisited neighbors.
  * Chessboard grid with squares marked land or water. List all islands. Walk and build sets of connected components.
* [Kahn’s topological sort](https://youtu.be/cIBFEhD77b4). For a directed acyclic graph, pick an order of vertices so if $A \lt B$ then there is no path $B \rightarrow A$.
  * Let $\mathcal{O}$ be empty topological order
  * Build array of number of incoming nodes into $A_k$: $[k_1, ..., k_n]$
  * Keep adding nodes with $k_i == 0$ and not in $\mathcal{O}$ to $\mathcal{O}$, decrementing the number of incoming nodes for their successors.
* [Dijkstra’s shortest path](https://youtu.be/pSqmAO-m7Lk): Given unoriented graph with positive edge costs, find shortest path from vertex $A_1$ to $A_n$.
  * Build array of vertex costs $\mathcal{C} = [c_1, ..., c_n]$ from $A_1$ to $(A_k)_{k \ge 1}$, starting from $A_1$ and walking to all neighbors not visited yet.
  * Build heap of unvisited elements $\mathcal{H} = [(A_k, c(A_1, A_k)), ... ]$, where $c(A_1, A_k)$ is cost from $A_1$ and keep adding to $\mathcal{C}$ while removing from $\mathcal{H}$.
  * Most efficient when heap is $E/V$-ary balanced tree. Complexity: $O(E \, log_{E/V}(V))$
  * State of the art uses Fibonacci heap, $O(E + V \, log(V))$
* [Kruskal's Algorithm - Minimal Spanning Tree](https://www.youtube.com/watch?v=JZBQLXgSGfs): Given unoriented graph with edge costs, find minimal cost spanning tree
  * Sort all edges by cost in list $\mathcal{C} = [[A_1, B_1], [A_2, B_2], ...]$
  * Build set of minimal spanning subtrees $\mathcal{S} = [\mathcal{S}_1, \mathcal{S}_2, ...]$
  * Remove edges in order from ${C}$. When removing $[A_k, B_k]$:
    * If vertices in none of the spanning subtrees, create new spanning subtree
    * If vertices both in the same spanning subtree, discard edge
    * If vertices in different spanning subtrees $\mathcal{S}_i$, $\mathcal{S}_j$, replace them both with $\mathcal{S}_i \cup \mathcal{S}_j \cup edge$
  * Complexity: $O(n)$
* [Union Find](https://www.youtube.com/watch?v=ibjEGG7ylHk)
  * Same as Kruskal's Algorithm
* [Dynamic Programming](https://www.youtube.com/watch?v=oBt53YbR9Kk)

#### Algorithms - Blog posts
* [Binary Search](https://leetcode.com/discuss/general-discussion/786126/Python-Powerful-Ultimate-Binary-Search-Template.-Solved-many-problems)

#### Algorithms - Practice

|Topic|Priority|
----------------
|Array|High|
|String|High|
|Hash Table|Mid|
|Recursion|Mid|
|Sorting and searching|High|
|Matrix|High|
|Linked List|Mid|
|Queue|Mid|
|Stack|Mid|
|Tree|High|
|Graph|High|
|Heap|Mid|
|Trie|Mid|
|Interval|Mid|
|Dynamic programming|Low|
|Binary|Low|
|Math|Low|
|Geometry|Low|

#### Blog Posts
* [Tech Interview Handbook](https://www.techinterviewhandbook.org/software-engineering-interview-guide/)
* [1](https://www.teamblind.com/post/7-onsites-7-offers-aAFTykAD)
