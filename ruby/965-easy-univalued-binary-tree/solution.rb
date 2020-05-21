# https://leetcode.com/problems/univalued-binary-tree/

# 965. Univalued Binary Tree
# Easy

# A binary tree is univalued if every node in the tree has the same value.

# Return true if and only if the given tree is univalued.

 
# Example 1:


# Input: [1,1,1,1,1,null,1]
# Output: true
# Example 2:


# Input: [2,2,2,5,2]
# Output: false
 

# Note:

# The number of nodes in the given tree will be in the range [1, 100].
# Each node's value will be an integer in the range [0, 99].


# Extra note: it appears all test cases have a non-null root


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#       @left = left
#       @right = right
#   end
# end
# @param {TreeNode} root
# @return {Boolean}
def is_unival_tree(root)
  return recursive_check_nodes(root, root.val)
end


def recursive_check_nodes(node, val)
  return false if node.val != val
  output_left = recursive_check_nodes(node.left, val) if node.left
  output_right = recursive_check_nodes(node.right, val) if node.right
  if output_left == false || output_right == false
    return false
  else
    return true
  end
end
