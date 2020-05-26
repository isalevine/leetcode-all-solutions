# https://leetcode.com/problems/second-minimum-node-in-a-binary-tree/

# 671. Second Minimum Node In a Binary Tree
# Easy

# Given a non-empty special binary tree consisting of nodes with the non-negative value, where each node in this tree has exactly two or zero sub-node. If the node has two sub-nodes, then this node's value is the smaller value among its two sub-nodes. More formally, the property root.val = min(root.left.val, root.right.val) always holds.

# Given such a binary tree, you need to output the second minimum value in the set made of all the nodes' value in the whole tree.

# If no such second minimum value exists, output -1 instead.

# Example 1:

# Input: 
#     2
#    / \
#   2   5
#      / \
#     5   7

# Output: 5
# Explanation: The smallest value is 2, the second smallest value is 5.
 

# Example 2:

# Input: 
#     2
#    / \
#   2   2

# Output: -1
# Explanation: The smallest value is 2, but there isn't any second smallest value.



# SOLUTION 1: Naive Solution (based on brute-force solution)

# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#     @left = left
#     @right = right
#   end
# end
# @param {TreeNode} root
# @return {Integer}
def find_second_minimum_value(root)
  values = {}
  values = record_all_values(root, values)

  if values.length < 2
    return -1
      
  else
    first_min, second_min = nil
    values.keys.each do |val|
        
      if !first_min
        first_min = val
      
      elsif !second_min
        if val < first_min
          second_min = first_min
          first_min = val
        else
          second_min = val   
        end 
        
      else
        if val < first_min
          second_min = first_min
          first_min = val
        elsif val > first_min && val < second_min
          second_min = val
        end
      end
    end
  end
  return second_min
end


def record_all_values(root, values)
  values[root.val] = true if !values[root.val]
  record_all_values(root.left, values) if root.left
  record_all_values(root.right, values) if root.right
  return values
end
