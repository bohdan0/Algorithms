# Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
# Find all the elements of [1, n] inclusive that do not appear in this array.

def find_disappeared_numbers(nums)
    result = []
    idx = 0
    while idx < nums.length
        if nums[nums[idx].abs - 1] > 0
            nums[nums[idx].abs - 1] *= -1
        end
        idx += 1
    end
    nums.each_with_index do |el, idx|
        if el > 0
             result << idx + 1
        end
    end
    
    result
end