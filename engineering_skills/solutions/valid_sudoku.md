---
layout: page
title: Valid Sudoku
mathjax: true
---

* [Valid Sudoku](https://leetcode.com/problems/valid-sudoku/)


```python
def is_valid_sudoku(board):
    # Check rows
    for row in board:
        if not is_valid(row):
            return False
    
    # Check columns
    for col in range(9):
        column = [board[row][col] for row in range(9)]
        if not is_valid(column):
            return False
    
    # Check sub-boxes
    for i in range(0, 9, 3):
        for j in range(0, 9, 3):
            sub_box = [board[row][col] for row in range(i, i+3) for col in range(j, j+3)]
            if not is_valid(sub_box):
                return False
    
    return True

def is_valid(nums):
    seen = set()
    for num in nums:
        if num != '.':
            if num in seen:
                return False
            seen.add(num)
    return True
```

#### Other
* [Engineering Skills](/engineering_skills)