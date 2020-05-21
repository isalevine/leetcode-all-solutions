# https://leetcode.com/problems/valid-parentheses/

# 20. Valid Parentheses
# Easy

# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Note that an empty string is also considered valid.

# Example 1:

# Input: "()"
# Output: true
# Example 2:

# Input: "()[]{}"
# Output: true
# Example 3:

# Input: "(]"
# Output: false
# Example 4:

# Input: "([)]"
# Output: false
# Example 5:

# Input: "{[]}"
# Output: true


class Solution:
    def isValid(self, s: str) -> bool:
        if s == '':
            return True
        
        character_dict = {
            '(': ')',
            '[': ']',
            '{': '}'
        }
        
        opening_stack = []
        characters = list(s)
        for character in characters:
            if character in character_dict.keys():
                opening_stack.append(character)
            elif character in character_dict.values():   
                if len(opening_stack) == 0 or character_dict[opening_stack.pop()] != character:
                    return False
        
        if len(opening_stack) > 0:
            return False
        
        return True
        