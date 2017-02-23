require "set"

# Write a method that will sum the digits of a positive integer.
# If it is greater than or equal to 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result.
# The result is called a 'digital root'.
# Do not use string conversion within your method.
def digital_root(number)
  return number if number < 10

  temp = 0
  until number.zero?
    temp += number % 10
    number /= 10
  end

  digital_root(temp)
end

# Write a function that takes a message and an increment amount.
# Output the same letters shifted by that amount in the alphabet.
# Assume lowercase and no punctuation.
# Preserve spaces.
def caesar_cipher(string, shift)
  result = ''
  alphabet = ('a'..'z').to_a

  string.each_char do |char|
    if char == ' '
      result << ' '
      next
    end

    old_idx = alphabet.index(char)
    new_idx = old_idx + shift
    new_idx = new_idx % alphabet.length if new_idx > alphabet.length
    result << alphabet[new_idx]
  end

  result
end

# Write a function that takes two strings.
# Return the longest common substring.
def common_substrings(string_one, string_two)
  shorter = string_one.length < string_two.length ? string_one : string_two
  longer = shorter == string_one ? string_two : string_one
  result = ''

  0.upto(shorter.length - 2) do |idx1|
    (idx1 + 1).upto(shorter.length - 1) do |idx2|
      sub_str = shorter[idx1..idx2]
      if sub_str.length > result.length && longer.include?(sub_str)
        result = sub_str
      end
    end
  end

  result
end

# Write a function that takes an array of integers and returns their sum.
# Use recursion.
def sum_rec(numbers, acc = 0)
  return acc if numbers.empty?
  acc += numbers.pop
  sum_rec(numbers, acc)
end

# Write a function that takes n, the length of the sequence.
# Return the first n elements from the fibonnacci sequence as an array.
def fibs(n)
  return [0, 1].take(n) if n < 3
  prev = fibs(n - 1)
  prev << prev[-1] + prev[-2]
end

# Write a function that takes a string.
# Return true if the string is a palindrome, otherwise return false.
# It should take less time and memory than reversing the string.
def is_palindrome?(string)
  start = 0
  finish = string.length - 1
  loop do
    if string[start] != string[finish]
      return false
    end
    break if start >= finish
    start += 1
    finish -= 1
  end

  true
end

# Write a method that takes a string as input.
# It should return true if the input is a valid IPv4 address.
# Valid IPs are anything between '0.0.0.0' and '255.255.255.255'.
def valid_ip?(string)
  string.split(".").all? { |num| num.to_i.between?(0, 255) }
end

# Implement the Folding Cipher.
# It folds the alphabet in half and uses the adjacent letter.
# a -> z, b -> y, c -> x, m -> n, etc...
def folding_cipher(string)
  alphabet = ('a'..'z').to_a
  result = ''

  string.each_char do |char|
    idx = alphabet.index(char)
    new_idx = alphabet.length - 1 - idx
    result << alphabet[new_idx]
  end

  result
end

# Write a method that finds all the unique substrings for a word.
def uniq_subs(string)
  hash_map = {}
  0.upto(string.length - 1) do |idx1|
    idx1.upto(string.length - 1) do |idx2|
      hash_map[string[idx1..idx2]] = true
    end
  end

  hash_map.keys
end

# Given an array of integers find the largest contiguous subsum.
# You can solve this trivially in O(n**2) time by considering all subarrays.
# Try to solve it in O(n) time with O(1) memory.
def lcs(array)

end

# Write a function that takes a year as a four digit integer.
# Returns an array of the 10 closest subsequent silly years.
# A silly year's first two digits plus the last two digits equal the middle two.
def silly_years(year)
  result = []
  until result.count == 10
    year += 1
    result << year if silly_year?(year)
  end

  result
end

def silly_year?(year)
  str = year.to_s
  two_first = str[0..1]
  two_last = str[-2..-1]
  two_middle = str[1..2]

  two_first.to_i + two_last.to_i == two_middle.to_i
end

# Take an array of integers, and integer k.
# Return all pairs that sum to k exactly.
# List the pairs in [min, max] order.
# Time complexity: O(n).
# Return a set.
def pair_sum(array, k)
  set = Set.new
  hash_map = {}

  array.each do |el|
    set.add([el, hash_map[el]].sort) if hash_map[el]
    hash_map[k - el] = el
  end

  set
end

# Take a matrix of integers and coordinates.
# The coordinates represent a rectangular region within the matrix
# Find the sum of numbers falling inside the rectangle.
# Time complexity: O(number of rows * number of columns).
def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)
  result = 0
  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |el, col_idx|
      if row_idx >= top_left_coords[0] && row_idx <= bottom_right_coords[0] &&
          col_idx >= top_left_coords[1] && col_idx <= bottom_right_coords[1]
        result += el
      end
    end
  end

  result
end

# Implement Merge Sort
# Hint: This typically involves a helper function.
def merge_sort(array)
  return array if array.length <= 1

  middle = array.length / 2
  left = array[0...middle]
  right = array[middle..-1]
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first < right.first
      result << left.shift
    else
      result << right.shift
    end
  end

  result + left + right
end

# Implement binary search.
# Return nil if the target isn't found.
def binary_search(array, target)
  return nil if array.empty?
  mid_idx = array.length / 2
  return mid_idx if array[mid_idx] == target

  if target < array[mid_idx]
    # left
    binary_search(array[0...mid_idx], target)
  else
    # right
    res = binary_search(array[(mid_idx + 1)..-1], target)
    res ? 1 + mid_idx + res : res
  end
end

# You are given a list of numbers in an array.
# Replace all the numbers with the product of all other numbers.
# Do this in O(n) time without using division.
def productify(array)
  product = array.inject(:*)
  array.map { |el| product / el }
end

# Write a function that takes an array and returns all of its subsets.
def subsets(array)
  return [[]] if array.empty?
  last = array.pop
  prev = subsets(array)
  prev + prev.map { |sub_arr| sub_arr + [last] }
end

# Return the indices of the start/end of the longest palindrome in the string.
# You could reverse the string and compare it to the original, but that is slow.
# Instead, you should be able to solve the problem with O(1) memory.
def longest_palindrome(string)
  longest = string[0]
  result = [0, 0]
  0.upto(string.length - 1) do |idx1|
    idx1.upto(string.length - 1) do |idx2|
      sub_str = string[idx1..idx2]
      if sub_str.length > longest.length &&
          sub_str == sub_str.reverse
        longest = sub_str
        result = [idx1, idx2]
      end
    end
  end

  result
end

# Given two arrays, find the intersection of both sets.
# It should be trivial to write an O(n**2) solution.
# Use sorting to solve in O(nlog(n)).
# Next, improve this to O(n) time (maybe use a non-array datastructure).
def fast_intersection(array_one, array_two)
  result = []
  hash_map = {}
  array_one.each { |el| hash_map[el] = true }
  array_two.each { |el| result << el if hash_map[el] }

  result
end

# Write a function that takes two arrays of integers
# Returns an array with all the subsets commmon to both arrays.
# Don't generate all subsets of both arrays, which would be exponential time.
# Instead, directly generate the subsets of both.
def common_subsets(array_one, array_two)
  subsets(fast_intersection(array_one, array_two))
end

# You are given an array and index.
# Find if it's possible to reach 0 by starting at the index.
# You can only move left or right by the distance found at array[index].
def can_win?(array, index)
  return false unless array[index]
  return true if array[index].zero?
  if index - array[index] > 0
    can_win?(array, index - array[index]) || can_win?(array, index + array[index])
  else
    can_win?(array, index + array[index])
  end
end

# Assume an array of length n, containing the numbers 1..n in jumbled order.
# "Sort" this array in O(n) time.
# Hint: You should be able to do this without looking at the input.
def sort1(array)
  (1..array.length).to_a
end

# Assume an array of length n with numbers in the range 1..N (N >= n).
# Sort this array in O(n + N) time.
# You may use O(N) memory.
def sort2(array, max_value)
  hash_map = {}
  array.each { |el| hash_map[el] = true }
  (1..max_value).to_a.select { |el| hash_map[el] }
end

# Say I give you an array of n strings, each of length k.
# Merge sort can sort this in O(knlog(n)).
# Sort the strings in O(kn).
# Hint: Do not compare any two strings.
# All strings contain only lowercase letters without whitespace or punctuation.
def sort3(array, length)
  
end

# Given an array, write a function that will return a random index of the array.
# The chance of returning a given index will vary with the value of the element.
# Probability of i should be the ith element divided by the sum of all elements.
def weighted_random_index(array)

end

# Given an array, move all zeros to the end.
# The order of non-zero elements does not matter.
# Try to accomplish this in O(n) time and O(1) space.
def move_zeros(array)
  start_idx = 0
  end_idx = array.length - 1
  end_idx -= 1 while array[end_idx].zero?

  while start_idx < end_idx
    if array[start_idx].zero?
      array[start_idx], array[end_idx] = array[end_idx], array[start_idx]
      end_idx -= 1
    end
    start_idx += 1
  end

  array
end

# Implement the 'look and say' function.
#'Look and say' takes an input array and outputs an array.
# The output describes the count of the elements in the input.

def look_and_say(array)
  # [ctr, el]
  result = []
  ctr = 1
  array.each_index do |idx|
    if array[idx + 1] == array[idx]
      ctr += 1
    else
      result << [ctr, array[idx]]
      ctr = 1
    end
  end

  result
end

# I give you a scrambled list of n unique integers between 0 and n.
# Tell me what number is missing?
# How could you solve the problem in O(n), and also O(1) space?
def sum_upon_sums(array)
  sum = (1..array.length).to_a.inject(:+)
  array.each { |el| sum -= el }
  sum
end

# Implement a stack with a max method that returns the maximum value.
# It should run in O(1) time.
class MaxStack

  def initialize
    @store = []
  end

  def push(el)
    max = empty? || el > @store.last[-1] ? el : @store.last[-1]
    @store << [el, max]
  end

  def pop
    @store.pop[0]
  end

  def max
    @store.last[-1]
  end

  def empty?
    @store.empty?
  end
end

# Implement a queue using stacks.
# That is, write enqueue and dequeue using only push and pop operations.
# In terms of performance, enqueue should be O(1).
# Dequeue may be worst-case O(n).
# In terms of ammortized time, dequeue should be O(1).
# Prove that your solution accomplishes this.
class StackQueue

  def initialize
    @in = MaxStack.new
    @out = MaxStack.new
  end

  def enqueue(el)
    @in.push(el)
  end

  def dequeue
    if @out.empty?
      move_elements
      dequeue
    else
      @out.pop
    end
  end

  private

  def move_elements
    until @in.empty?
      @out.push(@in.pop)
    end
  end
end

# Take an array, and a window size w.
# Find the maximum max - min within a range of w elements.
# First solve MaxStack.
# Write a MinMaxStack to track both the min and the max in a stack.
# Next, solve StackQueue.
# Write a MinMaxStackQueue which tracks both the min and max.
# Last, use MinMaxStackQueue to solve the problem.
class MinMaxStack
  attr_reader :length

  def initialize
    @store = []
    @length = 0
  end

  def push(el)
    min = empty? || el < @store.last[-2] ? el : @store.last[-2]
    max = empty? || el > @store.last[-1] ? el : @store.last[-1]
    @length += 1
    @store << [el, min, max]
  end

  def pop
    @length -= 1
    @store.pop.first
  end

  def max
    @store.last[-1]
  end

  def min
    @store.last[-2]
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue
  attr_reader :length

  def initialize
    @in = MaxStack.new
    @out = MaxStack.new
  end

  def enqueue(el)
    @in.push(el)
  end

  def dequeue
    if @out.empty?
      move_elements
      dequeue
    else
      @out.pop
    end
  end

  def min
    [@in.min, @out.min].min
  end

  def max
    [@in.max, @out.max].max
  end

  private

  def move_elements
    until @in.empty?
      @out.push(@in.pop)
    end
  end
end

def windowed_max_range(array, w)
  idx_start = 0
  idx_end = idx_start + w - 1
  result = nil
  while idx_end < array.length
    min_max_stack = MinMaxStack.new
    array[idx_start..idx_end].each { |el| min_max_stack.push(el) }
    new_max = min_max_stack.max - min_max_stack.min
    result = new_max if !result || new_max > result

    idx_start += 1
    idx_end += 1
  end

  result
end

# Suppose a hash representing a directory.
# All keys are strings with names for either folders or files.
# Keys that are folders point to nested hashes.
# Keys that are files point to "true".
# Write a function that takes such a hash.
# Return an array of strings with the path to each file in the hash.
def file_list(hash)

end

# Assume an array of non-negative integers.
# A second array is made by shuffling the first and deleting a random element.
# Given these two arrays, find which element is missing in the second array.
# Do this in linear time with constant memory use.
def find_missing_number(array_one, array_two)

end

# Create a function that takes three strings.
# Return whether the third is an interleaving of the first two.
# Interleaving means it contains the same characters and preserves their order.
def is_shuffle?(string_one, string_two, string_three)

end

# Write a function that takes an integer and returns it in binary form.
def binary(integer)

end

# Write a recursive function that takes a number and returns its factorial.
def recursive_factorial(number)

end

# Write an iterative function that takes a number and returns its factorial.
def iterative_factorial(number)

end

# Write a method that takes an array and returns all its permutations.
def permutations(array)
  
end
