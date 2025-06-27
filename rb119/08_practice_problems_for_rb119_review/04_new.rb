=begin
Create a method that takes an array of integers as an argument and returns an
array of two numbers that are closest together in value. If there are multiple
pairs that are equally close, return the pair that occurs first in the array.

Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

The above tests should each print true.
=end

=begin
PEDAC
P
Input: An arr of ints
Output: An arr of two ints that is the pair of closest nums in input arr
        - If multiple such pairs exist, return the first pair

E
p closest_numbers([5, 25, 15, 11, 20, 25]) == [25, 25] # Added myself
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

D
Input: An arr of ints
Output: An arr of two ints

A
Example analysis
Input:    [5, 25, 15, 11, 20]
Sorted:   [5, 11, 15, 20, 25]
Diffs:    [6, 4, 5, 5]
Min diff: 4
4 is at idx 1. 11 is at idx 1. 15 is at idx 1 + 1

Input:    [5, 25, 15, 11, 20, 25]
Sorted:   [5, 11, 15, 20, 25, 25]
Diffs:    [6, 4, 5, 5, 0]
Min diff: 4

# WRONG
- If I sort the arr, the pair has to come from two nums next to each other
  - The porblem is the arr no longer preserves original order
  - Find all the differences btw two nums in this arr
    - Then find the smallest diff
    - Use this smallest diff to find the pair (there might be more)
      - Put all nums with the min diff in an arr
      - Iterate over original arr
        - Return immediately the first num that appears in that arr of valid n
        - BREAK iteration
      - Iterate over original arr
        - Return immediately the first num found that is equal to n_first -
          diff_min or n_first + diff_min
        - BREAK iteration
- Return first and second target n in an arr

NOTE
This approach does not work for all edge cases. For instance, with an input arr
of [40, 10, 20, 30], this approach returns [40, 30], when the correct answer is
[10, 20].
=end

def closest_numbers(arr)
  arr_sorted = arr.sort
  diffs = []
  (0..arr_sorted.length - 2).each do |i_first|
    diffs << (arr_sorted[i_first + 1] - arr_sorted[i_first])
  end

  diff_min = diffs.min
  valid_pairs = []

  diffs.each_with_index do |diff, i|
    if diff == diff_min
      valid_pairs << arr_sorted[i]
      valid_pairs << arr_sorted[i + 1]
    end
  end

  num_1st = nil
  num_2nd = nil

  arr.each do |n|
    if valid_pairs.include?(n)
      num_1st = n
      break
    end
  end

  arr.each do |n|
    if n == num_1st + diff_min || n == num_1st - diff_min
      num_2nd = n
      break
    end
  end

  [num_1st, num_2nd]
end

p closest_numbers([5, 25, 15, 11, 20, 25]) # == [25, 25] # Added myself
p closest_numbers([5, 25, 15, 11, 20]) # == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) # == [25, 27]
p closest_numbers([12, 22, 7, 17]) # == [12, 7]
