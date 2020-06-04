# https://leetcode.com/problems/implement-strstr/


# 28. Implement strStr()
# Easy

# Implement strStr().

# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

# Example 1:

# Input: haystack = "hello", needle = "ll"
# Output: 2
# Example 2:

# Input: haystack = "aaaaa", needle = "bba"
# Output: -1
# Clarification:

# What should we return when needle is an empty string? This is a great question to ask during an interview.

# For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().



# Solution 1 - Naive Solution

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if haystack == needle || needle == ""
  return -1 if haystack == "" || needle.length > haystack.length
  
  output_index = nil
  haystack.split("").each_with_index do |hay_char, hay_index|
    if hay_char == needle[0]
      output_index = hay_index
      needle.split("").each_with_index do |needle_char, needle_index|
        output_index = nil if needle_char != haystack[needle_index + hay_index]    
      end
    end
    break if output_index || needle.length > haystack.length - hay_index
  end
  
  return output_index ||= -1 
end
