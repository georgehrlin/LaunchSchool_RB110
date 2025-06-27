=begin
Create a method that takes an array of integers as an argument. The method
should return the minimum sum of 5 consecutive numbers in the array. If the
array contains fewer than 5 elements, the method should return nil.

Examples:
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

The above tests should each print true.
=end

=begin
PEDAC
P
Input: An arr of ints
Output: An int that is the smallest possible sum of five consecutive ints in
        input arr
        - Return nil if input arr contains fewer than five ints

E
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

D
Input: An arr of ints
Intermediary: Arr of ints
Output: An int

A
- Generate an arr of the sums of all possible combinations of five ints
  - Manually set a collection of idxs from 0 to 4 for finding the subarr
    - (0..4)
  - Increment all the idxs in this collection for the appropriate num of times
    based on the size of the input arr
    - size of input arr - 5 + 1
- Return the smallest
=end

# Original attempt
# Time spent: 16:10
def minimum_sum(arr)
  return nil if arr.length < 5
  i_start = 0
  i_end = 4
  sums_of_five = []

  (arr.length - 4).times do
    sums_of_five << arr[i_start..i_end].sum
    i_start += 1
    i_end += 1
  end

  sums_of_five.min
end

# Refractored 1
def minimum_sum(arr)
  return nil if arr.length < 5
  i_start = 0
  sums = []

  (arr.length - 4).times do
    sums <<  arr[i_start, 5].sum
    i_start += 1
  end

  sums.min
end

# Refractored 2
def minimum_sum(arr)
  return nil if arr.length < 5
  i_start = 0
  i_end = 4
  sums_of_five = []

  until i_end == arr.length - 1 do
    sums_of_five << arr[i_start..i_end].sum
    i_start += 1
    i_end += 1
  end

  sums_of_five.min
end

# Version from LSBot review
def minimum_sum(arr)
  return nil if arr.length < 5
  (0..arr.length - 5).map { |i_start| arr[i_start, 5].sum }.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) # == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) # == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) # == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) # == -10
