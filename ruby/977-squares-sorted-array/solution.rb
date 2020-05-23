# https://leetcode.com/problems/squares-of-a-sorted-array/

# 977. Squares of a Sorted Array
# Easy

# Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

# Example 1:
# Input: [-4,-1,0,3,10]
# Output: [0,1,9,16,100]
# Example 2:

# Input: [-7,-3,2,3,11]
# Output: [4,9,9,49,121]
 
# Note:
# 1 <= A.length <= 10000
# -10000 <= A[i] <= 10000
# A is sorted in non-decreasing order.



# SOLUTION 1: Solving in Ruby, without any fancy Ruby array methods
# (only [], <<, shift, pop, and slice), NO automatic sorting

# @param {Integer[]} a
# @return {Integer[]}
def sorted_squares(a)
  negatives = slice_negatives(a) if a[0] < 0
  negatives ||= []
  positives = slice_zero_and_positives(a, negatives.length) if a[-1] >= 0
  positives ||= []
  return square_arrays_in_order(negatives, positives)
end


def slice_negatives(a)
  i = 0
  while a[i] && a[i] < 0
    i += 1
  end
  return a.slice(0..i-1)
end


def slice_zero_and_positives(a, starting_index)
  return a.slice(starting_index..-1)
end


def square_arrays_in_order(negatives, positives)
  negative_index = -1
  positive_index = 0
  squared_array = []
  while negatives[negative_index] || positives[positive_index]
    if negatives[negative_index] && ((negatives[negative_index] && !positives[positive_index]) || (negatives[negative_index].abs < positives[positive_index]))
      squared_array << negatives[negative_index]**2 
      negative_index -= 1
    elsif positives[positive_index] && ((positives[positive_index] && !negatives[negative_index]) || (positives[positive_index] <= negatives[negative_index].abs))
      squared_array << positives[positive_index]**2 
      positive_index += 1
    end
  end
  return squared_array
end
