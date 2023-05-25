---
layout: page
title: Two Sum
mathjax: true
---

* [Two Sum](https://leetcode.com/problems/two-sum/) (build hash of elem, idx then look up hash)

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        delta = {}
        for i in range(len(nums)):
            delta[target - nums[i]] = i
        
        # print(delta)
        for i in range(len(nums)):
            if nums[i] in delta:
                # Don't report duplicate indices
                if i != delta[nums[i]]:
                    return [i, delta[nums[i]]
```

#### Other
* [Engineering Skills](engineering_skills.md)