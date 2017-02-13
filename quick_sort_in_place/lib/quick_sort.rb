class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array.first
    left = array[1..-1].select { |el| el < pivot }
    right = array[1..-1].select { |el| el >= pivot }

    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # prc ||= Proc.new { |el1, el2| el1 <=> el2 }

  #   return array if length < 2

  #   pivot_idx = partition(array, start, length, &prc)

  #   left_length = pivot_idx - start
  #   right_length = length - (left_length + 1)
  #   sort2!(array, start, left_length, &prc)
  #   sort2!(array, pivot_idx + 1, right_length, &prc)

  #   array

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    prc ||= proc { |x, y| x <=> y }

    pivot = array[start]
    idx = QuickSort.partition(array, start, length, &prc)

    left_length = idx - start
    right_length = length - (left_length + 1)

    QuickSort.sort2!(array, start, left_length, &prc)
    QuickSort.sort2!(array, idx + 1, right_length, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= proc { |x, y| x <=> y }

    pivot_idx = start
    pivot = array[start]

    ((start + 1)...(start + length)).each do |idx|
      if prc.call(pivot, array[idx]) > 0
        array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
        pivot_idx += 1
      end
    end
    array[start], array[pivot_idx] = array[pivot_idx], array[start]

    pivot_idx
  end
end