---
layout: page
title: Partition List in Equal Subset Sums
mathjax: true
---

* [Partition List in Equal Subset Sums](https://leetcode.com/problems/partition-equal-subset-sum/submissions/)
```
class Solution:
    def __init__(self):
        self.dp = set()
    
    def hasSubarrayWithSum(self, nums: List[int], nums_sum: int, subarray_sum: int) -> bool:
        #print(f"nums={nums} sum={nums_sum}, subarray_sum={subarray_sum}")
        if (len(nums), subarray_sum) in self.dp:
            return False
        
        self.dp.add((len(nums), subarray_sum))
        
        if len(nums) == 0:
            return True if subarray_sum == 0 else False
        
        if subarray_sum > nums_sum:
            return False
        
        a = nums[0]
        nums = nums[1:]
        if a == subarray_sum:
            return True
        elif a > subarray_sum:
            return self.hasSubarrayWithSum(nums, nums_sum-a, subarray_sum)
        else:
            return self.hasSubarrayWithSum(nums, nums_sum-a, subarray_sum) or self.hasSubarrayWithSum(nums, nums_sum-a, subarray_sum - a)
    
    def canPartition(self, nums: List[int]) -> bool:
        nums_sum = sum(nums)
        if nums_sum % 2 == 1:
            return False
        return self.hasSubarrayWithSum(nums, nums_sum, nums_sum//2)
```

#### Other
* [Engineering Skills](engineering_skills.md)