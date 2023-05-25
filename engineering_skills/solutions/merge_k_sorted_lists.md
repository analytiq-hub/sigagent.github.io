---
layout: page
title: Merge k sorted lists
mathjax: true
---

* [Merge k sorted lists](https://leetcode.com/problems/merge-k-sorted-lists/)

```
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        
        sorted_list = None
        sorted_last = None
        
        while True:
            # Remove empty lists
            while None in lists:
                lists.remove(None)
            
            # Get min of remaining list
            min = None
            for l in lists:
                if min == None:
                    min = l.val
                    min_idx = lists.index(l)
                elif min > l.val:
                    min = l.val
                    min_idx = lists.index(l)
                    
            if min == None:
                # Exhausted the input
                return sorted_list
            
            # Take min element off its list
            elem = lists[min_idx]
            lists[min_idx] = elem.next
            if lists[min_idx] == None:
                del lists[min_idx]
            
            # Clear next elem
            elem.next = None
            
            # Add to sorted list
            if sorted_list == None:
                sorted_list = elem
            else:
                sorted_last.next = elem
                
            # Update last in list
            sorted_last = elem
            
        # Unreached
        return None
```

#### Other
* [Engineering Skills](/engineering_skills)