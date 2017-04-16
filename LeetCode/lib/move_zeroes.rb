def move_zeroes(nums)
    runner = 0
    wall_idx = 0
    while runner < nums.length
        if nums[runner] != 0
            nums[wall_idx] = nums[runner]
            wall_idx += 1
        end
        runner += 1
    end
    while wall_idx < nums.length
        nums[wall_idx] = 0
        wall_idx += 1
    end
    
    nums
end