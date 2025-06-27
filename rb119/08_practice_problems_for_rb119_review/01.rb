=begin
Create a method that takes an array of numbers as an argument. For each number,
determine how many numbers in the array are smaller than it, and place the
answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs
multiple times in the array, it should only be counted once.

Examples:
p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

The above tests should each print true.
=end

=begin
PEDAC
P
Input: An arr of ints
Output: An arr of ints which are the nums of ints in input arr that are smaller
        than the num at that idx
        - Repeating nums are only counted once for comparison

E
p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

D
Input: An arr of ints
Intermediary: Int, an arr of ints
Output: An arr of ints

A
- Generate an arr of ints by iterating over input arr (use #map potentially)
  - For current int, find out how many ints in input arr are smaller
    - Generate an arr of unique ints
    - Use #count to return the num of smaller nums
=end

# Original attempt
# Time spent: 8:59
def smaller_numbers_than_current(arr)
  arr.map do |int|
    arr.uniq.count { |n_unique| n_unique < int }
  end
end

# Improved after LSBot review
def smaller_numbers_than_current(arr)
  unique_nums = arr.uniq
  arr.map do |num_current|
    unique_nums.count { |num_unique| num_unique < num_current }
  end
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
