# You will be given an array of several arrays that each contain integers and your goal is to write a function that will sum up all the numbers in all the arrays. For example, if the input is [[3, 2], [1], [4, 12]] then your program should output 22 because 3 + 2 + 1 + 4 + 12 = 22.

def nested_sum(arr)
    return 0 if arr.empty?
    first = arr.first.is_a?(Integer) ? arr.first : nested_sum(arr.first)
    first + nested_sum(arr[1..-1])
end