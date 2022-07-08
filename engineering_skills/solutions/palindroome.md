---
layout: page
title: Longest Substring Without Repeating Characters
mathjax: true
---

* [Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)
```
import re

class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = re.sub(r'[^a-zA-Z0-9]', '', s).lower()
        #print(s)
        
        for i in range(len(s) // 2):
            j = len(s) - i - 1
            if s[i] != s[j]:
                #print(f"s[{i}]={s[i]} != s[{j}]={s[j]}")
                return False
        
        return True
```

#### Other
* [Engineering Skills](engineering_skills.md)