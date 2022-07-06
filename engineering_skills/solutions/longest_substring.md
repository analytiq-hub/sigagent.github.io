---
layout: page
title: Longest Substring Without Repeating Characters
mathjax: true
---

* [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/submissions/)
```
class Solution:
    
    def lengthOfLongestSubstring(self, s: str) -> int:
                
        if s == None or len(s) == 0:
            return 0
        if len(s) == 1:
            return 1
        
        maxlen = 1
        
        for i in range(len(s)):
            setofchars = set([s[i]])
            for j in range(i+1, len(s)):
                #print(f"i={i}, j={j}, str={s[i:j+1]}")
                if s[j] in setofchars:
                    break
                setofchars.add(s[j])
                maxlen = max(maxlen, j-i+1)

        return maxlen
```

#### Other
* [Engineering Skills](engineering_skills.md)