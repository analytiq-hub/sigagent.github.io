---
layout: page
title: Merge sorted arrays
mathjax: true
---

* [Merge Sorted Arrays](https://leetcode.com/problems/merge-sorted-array/)

```python
class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        k = m+n-1
        while k >= 0:
            # print(f"m={m}, n={n}, k={k}, nums1={nums1}, nums2={nums2}")
            if n <= 0 or (m > 0 and nums1[m-1] > nums2[n-1]):
                nums1[k] = nums1[m-1]
                m -= 1
            else:
                nums1[k] = nums2[n-1]
                n -= 1
            k -= 1
```

#### Other
* [Engineering Skills](engineering_skills.md)