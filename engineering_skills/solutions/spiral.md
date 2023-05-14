---
layout: page
title: Spiral Matrix
mathjax: true
---

* [Spiral Matrix](https://leetcode.com/problems/spiral-matrix/)

```python
class Solution:

    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:

        rows = len(matrix)
        cols = len(matrix[0])

        visited = set()
        spiral = []

        i, j = 0, 0

        spiral.append(matrix[0][0])
        visited.add((0, 0))
        #print((0, 0))

        while True:
            count = 0

            while j+1 < cols and (i, j+1) not in visited:
                j += 1
                spiral.append(matrix[i][j])
                visited.add((i, j))
                count += 1
                #print((i, j))

            while i+1 < rows and (i+1, j) not in visited:
                i += 1
                spiral.append(matrix[i][j])
                visited.add((i, j))
                count += 1
                #print((i, j))

            while j > 0 and (i, j-1) not in visited:
                j -= 1
                spiral.append(matrix[i][j])
                visited.add((i, j))
                count += 1
                #print((i, j))

            while i > 0 and (i-1, j) not in visited:
                i -= 1
                spiral.append(matrix[i][j])
                visited.add((i, j))
                count += 1
                #print((i, j))
            
            if count == 0:
                break

        return spiral
```

#### Other
* [Engineering Skills](/engineering_skills)