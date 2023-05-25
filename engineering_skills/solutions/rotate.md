---
layout: page
title: Rotate Image
mathjax: true
---

* [Rotate Image](https://leetcode.com/problems/rotate-image/)

```python
def rotate(matrix):
    n = len(matrix)
    
    # Transpose the matrix
    for i in range(n):
        for j in range(i, n):
            matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    
    # Reverse each row
    for i in range(n):
        matrix[i] = matrix[i][::-1]
```

#### Other
* [Engineering Skills](/engineering_skills)