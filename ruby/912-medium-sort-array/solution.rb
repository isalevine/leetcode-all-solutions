# https://leetcode.com/problems/sort-an-array/

# 912. Sort an Array
# Medium

# Given an array of integers nums, sort the array in ascending order.

 
# Example 1:

# Input: nums = [5,2,3,1]
# Output: [1,2,3,5]
# Example 2:

# Input: nums = [5,1,1,2,0,0]
# Output: [0,0,1,1,2,5]
 

# Constraints:

# 1 <= nums.length <= 50000
# -50000 <= nums[i] <= 50000


# OTHER NOTES:
# 1. There is a specific time limit, stress-tested with a large array of integers! Several solutions
# do not pass Leetcode tests due to this, although they are technically correct solutions.



# SOLUTION 2: Insertion Sort (based on https://medium.com/@limichelle21/read-it-learn-it-build-it-sorting-algorithms-in-ruby-ead04b04baa6)
# => FAILS Leetcode time limit stress test!

# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
  nums.length.times do |i|
    while i > 0
      if nums[i - 1] > nums[i]
        current_num = nums[i]
        nums[i] = nums[i - 1]
        nums[i - 1] = current_num
      else
        break
      end
      i -= 1
    end
  end
  return nums
end



# SOLUTION 1: Naive Solution - collect a hash of times each value shows up, collect arrays, and flatten.
# => FAILS Leetcode time limit stress test!

# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
  return nums if nums.length == 0
  
  number_hash = create_number_hash(nums)
  return create_sorted_array(number_hash).flatten
end


def create_number_hash(nums)
  number_hash = {}
  nums.each do |num|
    if number_hash[num]
      number_hash[num] += 1
    else
      number_hash[num] = 1
    end
  end
  return number_hash
end


def create_sorted_array(number_hash)
  sorted_array = []
  last_index = 0
  number_hash.each_pair do |key, value|
    num_array = Array.new(value, key)
    find_insert_index(sorted_array, last_index, num_array)
  end
  return sorted_array
end


def find_insert_index(sorted_array, last_index, num_array)
  if sorted_array.length == 0
    sorted_array << num_array 
  
  else
    value = num_array[0]
    if value <= sorted_array[last_index][0] && value > sorted_array[last_index - 1][0]
      sorted_array.insert(last_index, num_array)
    elsif value < sorted_array[last_index][0]
      if last_index = 0
        sorted_array.unshift(num_array)
      else
        last_index -= 1
        find_insert_index(sorted_array, last_index, num_array)
      end
    elsif value > sorted_array[last_index][0]
      if last_index == sorted_array.length - 1
        sorted_array.push(num_array)
      else
        last_index += 1
        find_insert_index(sorted_array, last_index, num_array)  
      end  
    end
  end
end
