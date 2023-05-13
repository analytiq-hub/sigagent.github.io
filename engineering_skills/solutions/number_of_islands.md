---
layout: page
title: Number of Islands
mathjax: true
---

* [Number of Islands](https://leetcode.com/problems/number-of-islands/)
```
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        
        # Build an adjacency list
        adj = {}
        
        i = 0
        for row in grid:
            j = 0
            for vertex in row:
                if vertex == "1":
                    adj[(i,j)] = set()
                    adj[(i, j)].add((i, j))
                    
                    if i > 0 and grid[i-1][j] == "1":
                        adj[(i, j)].add((i-1, j))
                        adj[(i-1, j)].add((i, j))

                    if j > 0 and grid[i][j-1] == "1":
                        adj[(i, j)].add((i, j-1))
                        adj[(i, j-1)].add((i, j))
                j += 1
            i += 1
        
        print(adj)
        
        # Build list of connected components
        cc = []
        
        # Build dict of cc members {vertex => conn_comp}
        ccd = {}
                
        for i in adj:
            found = False
            for j in cc:
                if i in j:
                    found = True
                    print(f"Found connected component {j}")
                    break
                
            if not found:
                j = [i]
                cc.append(j)
                print(f"Created connected component {j}")
                
            # Save in dict of cc members
            ccd[i] = j
            
            for k in adj[i]:
                if k in ccd:
                    j1 = ccd[k]
                    if j1 != j:
                        print(f"Merge {j} and {j1}")
                        cc.remove(j1)
                        j += j1
                        for k1 in ccd:
                            if ccd[k1] == j1:
                                ccd[k1] = j
                else:
                    j.append(k)
        
        print(cc)
        
        return len(cc)
```

#### Other
* [Engineering Skills](/engineering_skills)