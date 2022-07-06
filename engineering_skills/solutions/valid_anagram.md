---
layout: page
title: Valid Anagram
mathjax: true
---

* [Valid Anagram](https://leetcode.com/problems/valid-anagram)
```
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        s1 = sorted(s)
        t1 = sorted(t)
        
        if len(s1) != len(t1):
            return False
        
        for i in range(len(s1)):
            if s1[i] != t1[i]:
                return False
            
        return True
```

#### Other
* [Engineering Skills](engineering_skills.md)