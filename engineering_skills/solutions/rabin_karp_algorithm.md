---
layout: page
title: Rabin-Karp Algorithm
mathjax: true
---

The Rabin-Karp algorithm is a string matching algorithm that is used to search for a pattern within a longer text. It was developed by Michael O. Rabin and Richard M. Karp in 1987.

The algorithm works by using hashing to compare the pattern with each substring of the text. The basic idea is to use a hash function to convert the pattern and each substring of the text into a numeric value, and then compare these values. If the hash values match, it is possible that the pattern and substring are the same, so a more detailed comparison is done to confirm this.

Here's how the algorithm works:

* Compute the hash value of the pattern.
* For each substring of the text that is the same length as the pattern, compute its hash value.
* If the hash value of the substring matches the hash value of the pattern, compare the characters in the substring with the characters in the pattern to confirm that they are the same.
* If the characters are the same, the pattern has been found in the text. If not, move on to the next substring and repeat the process.

To improve the efficiency of the algorithm, a rolling hash function is used. This means that instead of computing the hash value of each substring from scratch, the hash value of the previous substring is used as a starting point for the hash value of the next substring. This allows the algorithm to compute the hash values more quickly, since only a small amount of work needs to be done for each new substring.

The Rabin-Karp algorithm has a time complexity of O(nm), where n is the length of the text and m is the length of the pattern. However, in practice it can be much faster than other string matching algorithms such as the naive algorithm or the Knuth-Morris-Pratt algorithm.

(Source: ChatGPT)

#### Other
* [Engineering Skills](/engineering_skills)