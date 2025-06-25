=begin
The maximum sum subarray problem consists in finding the maximum sum of a
continuous subsequence in an array of integers:

max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) # => 6

The easy case is when the array is made up of only positive numbers and the
maximum sum is the sum of the whole array. If the array is made up of only
negative numbers, return 0 instead.

An empty array is considered to have a zero greatest sum. Note that the empty
array is also a valid subarray.

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
=end

=begin
PEDAC
P
Input: An arr of ints
Output: An int that is the largest possible sum of a continuous subarr of the
        input arr
        - -1 if all ints are negative
        - 0 if input arr is empty

E
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

D
Input: An arr of ints
Intermediary: Arrs of ints
Output: An int

A
- Generate an arr of all possible subarrs of input arr (HELPER)
  - Initialize an empty arr, subarrs
  - Iterate over input arr index
    - Iterate over possible subarr lengths (1 to arr's length - current index)
    - Append each subarr from arr index of current length to subarrs

- Find the subarr that produces the largest sum
  - Use HELPER to generate an arr of all possible subarrs
  - Use max_by to find target subarr
- Return this subarr's sum
=end

def all_subarrs(arr)
  subarrs = []
  arr.each_index do |i|
    (1..arr.length - i).each do |subarr_len|
      subarrs << arr[i, subarr_len]
    end
  end

  subarrs
end

def max_sequence(arr)
  return 0 if arr.all? { |n| n.negative? }
  subarrs = all_subarrs(arr)
  subarrs.max_by { |subarr| subarr.sum }.sum
end

p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
