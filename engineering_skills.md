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
* W. Larson: [Staff Engineer: Leadership beyond the management track](https://www.amazon.com/Staff-Engineer-Leadership-beyond-management-ebook/dp/B08RMSHYGG)

#### Talks
* H. Fisk: [Large-Scale Low-Latency Storage for the Social Network](https://www.youtube.com/watch?v=5RfFhMwRAic) (2013)

### System Design
* Alex Xu: [System Design Interview – An insider's guide](https://www.amazon.com/System-Design-Interview-insiders-Second/dp/B08CMF2CQF)
* M. Kleppmann: [Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems](https://www.amazon.com/Designing-Data-Intensive-Applications-Reliable-Maintainable/dp/1449373321)
* [Consistent hashing](https://en.wikipedia.org/wiki/Consistent_hashing)
* [Distributed hash table](https://en.wikipedia.org/wiki/Distributed_hash_table)
  * G. DeCandia et al: [Dynamo: Amazon’s Highly Available Key-value Store](https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf (2007))
* Tuchar Roy
  * [System Design: Intro](https://www.youtube.com/watch?v=UzLMhqg3_Wc&list=RDCMUCZLJf_R2sWyUtXSKiKlyvAw&start_radio=1&rv=UzLMhqg3_Wc&t=624)
  * [System Design : Distributed Database System Key Value Store](https://www.youtube.com/watch?v=UzLMhqg3_Wc&list=RDCMUCZLJf_R2sWyUtXSKiKlyvAw&start_radio=1&rv=UzLMhqg3_Wc&t=624)

#### Storage and Retrieval
* R. Jain: [System Design: LSM Trees | Data Structure Behind Google and Facebook Storage Engine](https://www.youtube.com/watch?v=P2xtlLymqqI)

#### Algorithms
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
* [Binary Search](https://leetcode.com/discuss/general-discussion/786126/Python-Powerful-Ultimate-Binary-Search-Template.-Solved-many-problems)

#### C++ questions
* What are the differences between C++ and C?
* What is a vtable? What are virtual functions?
* How is static different in C vs C++?
* What options do you have for smart pointers in C++?
  * std::unique_ptr<X>. The object is disposed of, using the associated deleter when either of the following happens:
    * the managing unique_ptr object is destroyed
    * the managing unique_ptr object is assigned another pointer via operator= or reset().
  * std::shared_ptr<X>
  * std::weak_ptr<X>: Provides access to an object that is owned by one or more shared_ptr instances, but does not participate in reference counting.
* Is there an overhead for using exceptions in C++?
* How are templates different from macros?
* What is the auto keyword?
* [When should static_cast, dynamic_cast, const_cast and reinterpret_cast be used](https://stackoverflow.com/questions/332030/when-should-static-cast-dynamic-cast-const-cast-and-reinterpret-cast-be-used)?
  * Use dynamic_cast for converting pointers/references within an inheritance hierarchy.
  * Use static_cast for ordinary type conversions.
  * Use reinterpret_cast for low-level reinterpreting of bit patterns. Use with extreme caution.
  * Use const_cast for casting away const/volatile. Avoid this unless you are stuck using a const-incorrect API.
* Can you overload logical operators `&&, ||` in C++, and what are the pitfalls in doing that?

#### Python
* Function arguments - [when are they passed by value, and when by reference](https://stackoverflow.com/questions/9696495/python-when-is-a-variable-passed-by-reference-and-when-by-value)?
* How is global used in python?
* How is global used in multiple files?
* How do classes work in python? (Constructor, destructor, private/public data members, private/public functions). 
* def __init__(self)
* def __del__(self)
* How does inheritance work?
* How are ways to format strings in python?
  * `"key={}".format(value)`
  * `"key=%s" % (value)"`
  * `f"key={value}"`
* Can a function return multiple values?
* What are decorators in python?
```
def decorator_sample(func):
    def decorator_hook(*args, **kwargs):
        print("Before the function call")
        result = func(*args, **kwargs)
        print("After the function call")
        return result
    return decorator_hook

@decorator_sample
def product(x, y):
    return x*y
```
* What is pickling and unpickling?
* What is module and package in Python?
  * Module is the way to structure program. Each Python program file is a module, which imports other modules like objects and attributes.
  * The folder of Python program is a package of modules. A package can have modules or subfolders.
* What are `*args` and `**kwargs` in Python functions?
  * If you put `*args` in a function's parameter list, all unnamed arguments will be stored in the args array. 
  * `**kwargs` creates a dictionary of named parameters.
* What is virtualenv?


#### Blog Posts
* [Tech Interview Handbook](https://www.techinterviewhandbook.org/software-engineering-interview-guide/)
* [1](https://www.teamblind.com/post/7-onsites-7-offers-aAFTykAD)

#### Other
* [Algorithms Practice](engineering_skills/algorithms_practice.md)
* [Diagrams Practice](engineering_skills/diagrams_practice.md)