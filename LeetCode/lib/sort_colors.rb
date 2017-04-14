# Given an array with n objects colored red, white or blue, sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.
# Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

def sort_colors(nums)
    ctr_0 = 0
    ctr_1 = 0
    ctr_2 = 0
    nums.each do |el|
        case el
        when 0 then ctr_0 += 1
        when 1 then ctr_1 += 1
        when 2 then ctr_2 += 1
        end
    end
    
    (0...nums.length).each do |idx|
        if ctr_0 > 0
            nums[idx] = 0
            ctr_0 -= 1
        elsif ctr_1 > 0
            nums[idx] = 1
            ctr_1 -= 1
        else
            nums[idx] = 2
        end
    end
end