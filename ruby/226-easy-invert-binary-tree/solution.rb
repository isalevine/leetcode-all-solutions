# https://leetcode.com/problems/invert-binary-tree/

# 226. Invert Binary Tree
# Easy

# Invert a binary tree.

# Example:

# Input:
#      4
#    /   \
#   2     7
#  / \   / \
# 1   3 6   9

# Output:
#      4
#    /   \
#   7     2
#  / \   / \
# 9   6 3   1

# Trivia:
# This problem was inspired by this original tweet by Max Howell:
# Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.




# SOLUTION 2: The exact same thing as Solution 1, without the unnecessary extra function
# (from the Leetcode solution)

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
# @return {TreeNode}
def invert_tree(root)
  return root if !root
  new_left = invert_tree(root.right)
  new_right = invert_tree(root.left)
  root.left = new_left
  root.right = new_right
  return root
end



# SOLUTION 1: Naive Solution
# (This involves an unnecessary function, but does explicitly lay out how the nodes are manipulated)

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
# @return {TreeNode}
def invert_tree(root)
  return root if !root || (!root.left && !root.right)
  new_nodes = recursive_reverse_pairs(root.left, root.right)
  root.left = new_nodes[0]
  root.right = new_nodes[1]
  return root
end


def recursive_reverse_pairs(left_node, right_node)
  new_left, new_right = nil, nil
  left_left, left_right, right_left, right_right = nil, nil, nil, nil
  new_nodes_outer, new_nodes_inner = [nil, nil], [nil, nil]
  
  if left_node
    new_right = TreeNode.new(left_node.val)
    left_left = left_node.left
    left_right = left_node.right
  end
  if right_node
    new_left = TreeNode.new(right_node.val)
    right_left = right_node.left
    right_right = right_node.right
  end
  
  if left_left || left_right || right_left || right_right
    new_nodes_outer = recursive_reverse_pairs(left_left, right_right)
    new_nodes_inner = recursive_reverse_pairs(right_left, left_right)
  end
  
  if new_left
    new_left.left = new_nodes_outer[0]
    new_left.right = new_nodes_inner[1]
  end
  if new_right
    new_right.left = new_nodes_inner[0]
    new_right.right = new_nodes_outer[1]
  end
  
  return [new_left, new_right]
end
