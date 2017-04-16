def find_duplicate(nums)
    quick_sort!(nums)
    idx = 0
    while idx < nums.length - 1
        return nums[idx] if nums[idx] == nums[idx + 1]
        idx += 1
    end
end

def quick_sort!(arr, start_idx = 0, end_idx = arr.length)
    return arr if end_idx - start_idx <= 1
    pivot_idx = partition(arr, start_idx, end_idx)
    quick_sort!(arr, start_idx, pivot_idx)
    quick_sort!(arr, pivot_idx + 1, end_idx)
end

def partition(arr, start_idx, end_idx)
    pivot_idx = start_idx
    wall_idx = start_idx
    ((start_idx + 1)...end_idx).each do |idx|
         if arr[idx] <= arr[pivot_idx]
             wall_idx += 1
             arr[idx], arr[wall_idx] = arr[wall_idx], arr[idx]
         end
    end
    arr[pivot_idx], arr[wall_idx] = arr[wall_idx], arr[pivot_idx]
    wall_idx
end