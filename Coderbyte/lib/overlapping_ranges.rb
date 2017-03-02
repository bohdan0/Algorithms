# You will be given an array with 5 numbers. The first 2 numbers represent a range, and the next two numbers represent another range. The final number in the array is X. The goal of your program is to determine if both ranges overlap by at least X numbers. For example, in the array [4, 10, 2, 6, 3] the ranges 4 to 10 and 2 to 6 overlap by at least 3 numbers (4, 5, 6), so your program should return true.

def overlapping_ranges(arr)
    min_1 = arr[0]
    max_1 = arr[1]
    min_2 = arr[2]
    max_2 = arr[3]
    intersect = arr[4]

    min = [min_1, min_2].max
    max = [max_1, max_2].min

    max - min >= intersect
end