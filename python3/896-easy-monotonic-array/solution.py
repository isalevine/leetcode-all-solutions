# https://leetcode.com/problems/monotonic-array/

# 896. Monotonic Array
# Easy

# An array is monotonic if it is either monotone increasing or monotone decreasing.

# An array A is monotone increasing if for all i <= j, A[i] <= A[j].  An array A is monotone decreasing if for all i <= j, A[i] >= A[j].

# Return true if and only if the given array A is monotonic.

 
# Example 1:

# Input: [1,2,2,3]
# Output: true
# Example 2:

# Input: [6,5,4,4]
# Output: true
# Example 3:

# Input: [1,3,2]
# Output: false
# Example 4:

# Input: [1,2,4,5]
# Output: true
# Example 5:

# Input: [1,1,1]
# Output: true
 

# Note:

# 1 <= A.length <= 50000
# -100000 <= A[i] <= 100000


class Solution:
    def isMonotonic(self, A: List[int]) -> bool:
        if len(A) == 0 or len(A) == 1:
            return True
        
        direction = None
        
        for i in range(len(A) - 1):
            current_num = A[i]
            next_num = A[i + 1]
            
            if direction is None:
                if current_num > next_num:
                    direction = "down"
                elif current_num < next_num:
                    direction = "up"
                    
            if direction == "down" and current_num < next_num:
                return False
            elif direction == "up" and current_num > next_num:
                return False
                
        return True
            