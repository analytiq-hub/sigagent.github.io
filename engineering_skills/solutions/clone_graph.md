---
layout: page
title: Clone Graph
mathjax: true
---

* [Clone Graph](https://leetcode.com/problems/clone-graph/submissions/)

```
"""
# Definition for a Node.
class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []
"""

class Solution:
    def cloneGraph(self, node: 'Node') -> 'Node':
        if node == None:
            return None
        
        # Collect all nodes in the graph
        uncloned = [node]
        copies = []
        clones = []
        while True:
            a = uncloned.pop(0)
            # Create clone
            a1 = Node(a.val, None)
            copies.append(a)
            clones.append(a1)
            for b in a.neighbors:
                #print(f"-> {a.val} neighbor {b.val}")
                if b not in copies:
                    uncloned.append(b)
            if len(uncloned) == 0:
                break
        
        # At this point, we cloned all nodes, but did not set up the neighbor pointer
        for a in copies:
            i = copies.index(a)
            for b in a.neighbors:
                #print(f"{a.val} neighbor {b.val}")
                j = copies.index(b)
                if clones[j] not in clones[i].neighbors:
                    clones[i].neighbors.append(clones[j])
        
        return clones[0]
```

#### Other
* [Engineering Skills](engineering_skills.md)