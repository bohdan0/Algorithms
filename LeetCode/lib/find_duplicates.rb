# Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
# Find all the elements that appear twice in this array.

def find_duplicates(nums)
    result = []
    idx = 0
    while idx < nums.length
        if nums[nums[idx].abs - 1] < 0
            result << nums[idx].abs
        else
            nums[nums[idx].abs - 1] *= -1
        end
        idx += 1    
    end
    
    result
end