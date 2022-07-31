---
layout: page
title: Course Schedule
mathjax: true
---

* [Course Schedule](https://leetcode.com/problems/course-schedule/submissions/)

```
class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        courses_remaining = set(range(numCourses))    
        courses_scheduled = set()
        
        # Index the prerequisites by course
        deps = dict()
        for p in prerequisites:
            if p[0] not in deps:
                deps[p[0]] = set([p[1]])
            else:
                deps[p[0]].add(p[1])
                
        #print(deps)

        # Keep scheduling courses that have met their requirements
        while True:
            if len(courses_remaining) == 0:
                return True
            courses_ready = courses_remaining - deps.keys()
            if len(courses_ready) == 0:
                return False
            
            courses_remaining -= courses_ready
            courses_scheduled |= courses_ready
            #print(f"Courses ready {courses_ready} remaining {courses_remaining} scheduled {courses_scheduled} deps {deps}")
            
            remove_keys = set()
            for c in deps:
                deps[c] -= courses_ready
                if len(deps[c]) == 0:
                    remove_keys.add(c)
            for c in remove_keys:
                deps.pop(c)  
        
        # Not reached
        return False
```

#### Other
* [Engineering Skills](engineering_skills.md)