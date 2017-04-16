def missing_number(nums)
    sum = (nums.length**2 + nums.length) / 2
    nums.each do |el|
        sum -= el 
    end
    sum
end