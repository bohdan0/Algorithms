# Given a non-empty array of integers, return the third maximum number in this array. If it does not exist, return the maximum number

def third_max(nums)
    first_greater = nil
    second_greater = nil
    third_greater = nil
    nums.each do |el|
        next if el == first_greater || el == second_greater || el == third_greater
        if !first_greater || el > first_greater
            third_greater = second_greater
            second_greater = first_greater
            first_greater = el
        elsif !second_greater || el > second_greater
            third_greater = second_greater
            second_greater = el
        elsif !third_greater || el > third_greater
            third_greater = el
        end
    end
    
    third_greater || first_greater
end