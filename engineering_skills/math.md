---
layout: page
title: Math Exercises
mathjax: true
---

* [Square root of x](https://leetcode.com/problems/sqrtx/)
```
class Solution:
    def check(self, mid, x):
        square = mid**2
        next_square = (mid+1)**2
        if x >= square and x < next_square:
            return 0
        elif x > square:
            # Go right
            return 1
        else:
            # Go left
            return -1
    
    def mySqrt(self, x: int) -> int:
        low, high = 0, x
        mid = (low+high)//2
        while True:
            #print(f"low {low} mid {mid} high {high}")
            ret = self.check(mid, x)
            if ret == 0:
                return mid
            elif ret > 0:
                # Go right
                low = mid
                mid = (mid + high + 1) // 2
            else:
                # Go left
                high = mid
                mid = (low + mid) // 2
```

#### References
* [Tech Interview Handbook - Algorithms](https://www.techinterviewhandbook.org/algorithms/study-cheatsheet/)

#### Other
* [Engineering Skills](engineering_skills.md)