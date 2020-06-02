# https://leetcode.com/problems/count-and-say/


# 38. Count and Say
# Easy

# The count-and-say sequence is the sequence of integers with the first five terms as following:

# 1.     1
# 2.     11
# 3.     21
# 4.     1211
# 5.     111221
# 1 is read off as "one 1" or 11.
# 11 is read off as "two 1s" or 21.
# 21 is read off as "one 2, then one 1" or 1211.

# Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence. You can do so recursively, in other words from the previous member read off the digits, counting the number of digits in groups of the same digit.

# Note: Each term of the sequence of integers will be represented as a string.

 
# Example 1:

# Input: 1
# Output: "1"
# Explanation: This is the base case.
# Example 2:

# Input: 4
# Output: "1211"
# Explanation: For n = 3 the term was "21" in which we have two groups "2" and "1", "2" can be read as "12" which means frequency = 1 and value = 2, the same way "1" is read as "11", so the answer is the concatenation of "12" and "11" which is "1211".



# @param {Integer} n
# @return {String}
def count_and_say(n)
  return "1" if n == 1
  
  output = nil
  n.times do
    output = recursive_count(output)  
  end
  return output
end


def recursive_count(num = nil)
  return 1 if !num
  
  new_num = []
  num.to_s.each_char do |digit|
    if new_num.empty? || new_num[-1][:num] != digit
      new_num << {length: 1, num: digit}
    else
      new_num[-1][:length] += 1
    end
  end
  
  output_num = ""
  new_num.each do |digits|
    output_num.concat("#{digits[:length]}#{digits[:num]}")
  end
  
  return output_num
end
