---
layout: page
title: 01 Matrix
mathjax: true
---

* [01 Matrix](https://leetcode.com/problems/01-matrix/)
```
class Solution:
    # Input:  [[0,0,0],
    #          [0,1,0],
    #          [0,0,0]]
    # Output: [[0,0,0],
    #          [0,1,0],
    #          [0,0,0]]
    # Input:  [[0,0,0],
    #          [0,1,0],
    #          [1,1,1]]
    # Output: [[0,0,0],
    #          [0,1,0],
    #          [1,2,1]]
    # Input:  [[0,0,1,0,1,1,1,0,1,1],
    #          [1,1,1,1,0,1,1,1,1,1],
    #          [1,1,1,1,1,0,0,0,1,1],
    #          [1,0,1,0,1,1,1,0,1,1],
    #          [0,0,1,1,1,0,1,1,1,1],
    #          [1,0,1,1,1,1,1,1,1,1],
    #          [1,1,1,1,0,1,0,1,0,1],
    #          [0,1,0,0,0,1,0,0,1,1],
    #          [1,1,1,0,1,1,0,1,0,1],
    #          [1,0,1,1,1,0,1,1,1,0]]
    # Output: [[0,0,1,0,1,2,1,0,1,2],
    #          [1,1,2,1,0,1,1,1,2,3],
    #          [2,1,2,1,1,0,0,0,1,2],
    #          [1,0,1,0,1,1,1,0,1,2],
    #          [0,0,1,1,1,0,1,1,2,3],
    #          [1,0,1,2,1,1,1,2,1,2],
    #          [1,1,1,1,0,1,0,1,0,1],
    #          [0,1,0,0,0,1,0,0,1,2],
    #          [1,1,1,0,1,1,0,1,0,1],
    #          [1,0,1,1,1,0,1,2,1,0]]

    def maybe_enqueue(self, 
                      mat: List[List[int]], 
                      to_visit: list,
                      enqueued_mat: List[List[int]], 
                      row : int, col : int, dist : int):
        
        if row >= 0 and row < len(mat) and col >= 0 and col < len(mat[0]):
            if enqueued_mat[row][col] == 0:
                to_visit.append((row, col, dist))
                enqueued_mat[row][col] == 1
    
    def dist(self, 
             mat: List[List[int]], 
             row : int, col : int):
        
        enqueued_mat = self.zero_mat(len(mat), len(mat[0]))

        to_visit = [(row, col, 0)]
        
        while len(to_visit) > 0:
            # Dequeue first element
            (row, col, dist) = to_visit.pop(0)
            
            if mat[row][col] == 0:
                return dist
            
            self.maybe_enqueue(mat, to_visit, enqueued_mat, row-1, col, dist+1)
            self.maybe_enqueue(mat, to_visit, enqueued_mat, row+1, col, dist+1)
            self.maybe_enqueue(mat, to_visit, enqueued_mat, row, col-1, dist+1)
            self.maybe_enqueue(mat, to_visit, enqueued_mat, row, col+1, dist+1)
            
                
        # Should never happen b/c matrix has at least a zero entry
        return -1
    
    def zero_mat(self, col, row):
        mat = list(list(0 for i in range(row)) for j in range(col))
        return mat

    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:

        dist_mat = self.zero_mat(len(mat), len(mat[0]))
        
        for i in range(len(mat)):
            for j in range(len(mat[0])):
                dist_mat[i][j] = self.dist(mat, i, j)
        
        return dist_mat
```

#### Other
* [Engineering Skills](engineering_skills.md)