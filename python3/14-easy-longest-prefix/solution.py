# https://leetcode.com/problems/longest-common-prefix/

# 14. Longest Common Prefix
# Easy

# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

# Note:
# All given inputs are in lowercase letters a-z.


class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if len(strs) == 0:
            return ""
        
        output = ""
        prefix = True
        for index in range(len(strs[0])):
            if prefix is False:
                break
                
            letter = strs[0][index]
            for string in strs:
                if index >= len(string) or string[index] != letter:
                    prefix = False
                    break
                    
            if prefix is True:
                output += letter
                
        return output
