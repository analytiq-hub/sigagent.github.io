---
layout: page
title: 01 Matrix
mathjax: true
---

* [01 Matrix](https://leetcode.com/problems/01-matrix/)

The solution below is too slow. A better solution:
- Walk the matrix and find all zeros.
- All neighbors have distance one
- All neighbor's neighbors have distance two, etc, using breadth-first search

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

    
    def zero_mat(self, col, row):
        mat = list(list(0 for i in range(row)) for j in range(col))
        return mat
    
    def maybe_enqueue(self, row : int, col : int, dist : int):
        
        if row >= 0 and row < self.rows and col >= 0 and col < self.cols:
            if self.dist_mat[row][col] == -1:
                self.dist_mat[row][col] = dist
                self.to_visit.append((row, col, dist+1))
                #print(f"({row}, {col}) dist {dist}")
                #print(f"Neighbors of ({row}, {col}) dist {dist+1}")
                #print(f"Queue: {self.to_visit}")

    def updateMatrix(self, mat: List[List[int]]) -> List[List[int]]:

        self.mat = mat
        self.rows = len(mat)
        self.cols = len(mat[0])
                
        # Create zero matrix
        self.dist_mat = self.zero_mat(self.rows, self.cols)

        # List of entries to visit
        self.to_visit = []

        # Initialize it to 0 for zero entries and -1 for anything else
        for row in range(self.rows):
            for col in range(self.cols):
                self.dist_mat[row][col] = -1
                if mat[row][col] == 0:
                    self.maybe_enqueue(row, col, 0)
                    
        #print(f"Start while loop")
        
        while len(self.to_visit) > 0:
            (row, col, dist) = self.to_visit.pop(0)
            #print(f"Dequeued ({row}, {col}, {dist})")
            self.maybe_enqueue(row-1, col, dist)
            self.maybe_enqueue(row+1, col, dist)
            self.maybe_enqueue(row, col-1, dist)
            self.maybe_enqueue(row, col+1, dist)
        
        return self.dist_mat
```

#### Other
* [Engineering Skills](engineering_skills.md)