# There are two sorted arrays nums1 and nums2 of size m and n respectively.
# Find the median of the two sorted arrays.

def find_median_sorted_arrays(nums1, nums2)
    median_1 = find_median(nums1)
    median_2 = find_median(nums2)
    if median_1.zero?
        median_2
    elsif median_2.zero?
        median_1
    else
        (median_1 + median_2) / 2.0
    end
end

def find_median(arr)
    return 0 if arr.empty?
    middle_idx = arr.length / 2
    if arr.length.even?
        (arr[middle_idx - 1] + arr[middle_idx]) / 2.0
    else
        arr[middle_idx]
    end
end