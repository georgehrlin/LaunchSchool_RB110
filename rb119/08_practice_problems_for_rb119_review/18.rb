=begin
Create a method that takes an array of integers as an argument. Determine and
return the index N for which all numbers with an index less than N sum to the
same value as the numbers with an index greater than N. If there is no index
that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the
smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the
numbers to the right of the last element is 0.

Examples:
p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([0, 2, 4, 4, 2, 3, 2]) == -1

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

The above tests should each print true.
=end

=begin
PEDAC
P
Input: An arr of ints
Output: An int that is the index N
        - All ints before index N sum up to the same as all ints after index N
        - Int at idx N is not included in calculation
        - Return -1 if a valid N does not exist
        - Return the smaller N if multiple Ns exist

E
p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([0, 2, 4, 4, 2, 3, 2]) == -1

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

D
Input: An arr of ints
Intermediary: At least two arrs of ints potentially
Output: An int

A
- Initialize an empty arr, valid_ns
- Iterate over each idx of input arr
- Split input arr at current idx into two subarrs
  - subarr1 is input arr from 0 to current idx, not inclusive
  - subarr2 is input arr from current idx + 1 to len of input arr, not
    inclusive
  - IF subarrs sum up to the same
    - Append current idx to valid_ns
- Return the minimum of valid_ns
=end

=begin
# Original attempt
# Time spent: 18:29
def equal_sum_index(arr)
  valid_ns = []
  arr.each_index do |current_i|
    if arr[0...current_i].sum == arr[current_i + 1...arr.length].sum
      valid_ns << current_i
    end
  end

  valid_ns.empty? ? -1 : valid_ns.min
end
=end

# Attempt after LSBot review, intergrating all LSBot suggestions
def equal_sum_index(arr)
  arr.each_index.find do |i|
    arr[0...i].sum == arr[i+1...].sum
  end || -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([0, 2, 4, 4, 2, 3, 2]) == -1
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0
