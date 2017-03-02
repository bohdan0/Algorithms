# Write a function called lucky_sevens which takes an array of integers and returns true if any three consecutive elements sum to 7.

def lucky_sevens(arr)
    arr.each_index do |i|
        next unless arr[i - 1] && arr[i + 1]
        return true if arr[i - 1] + arr[i] + arr[i + 1] == 7
    end

    false
end