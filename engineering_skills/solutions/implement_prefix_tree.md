---
layout: page
title: Implement Prefix Tree
mathjax: true
---

* [Implement prefix tree](https://leetcode.com/problems/implement-trie-prefix-tree/)

```
class Trie:

    def __init__(self):
        self.trie = {}
        self.set = set()

    def insert(self, word: str) -> None:
        self.set.add(word)
        for i in range(len(word)+1):
            if word[:i] not in self.trie:
                self.trie[word[:i]] = set([word])
            else:
                self.trie[word[:i]].add(word)
        

    def search(self, word: str) -> bool:
        if word in self.set:
            return True
        return False

    def startsWith(self, prefix: str) -> bool:
        if prefix in self.trie:
            return True
        else:
            return False


# Your Trie object will be instantiated and called as such:
# obj = Trie()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.startsWith(prefix)
```

#### Other
* [Engineering Skills](/engineering_skills)