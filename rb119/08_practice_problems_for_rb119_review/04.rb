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
Output: An arr of two ints that are the closest to each other in value
        - If there are multiple pairs with same difference, return first pair

E
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

D
Input: An arr of ints
Output: An arr of two ints

A
- Generate a hsh with keys that are ints from input arr and vals that are arrs
  of differences between the key int and all the other ints
  - Use map to iterate over input arr with idx (i)
    - Iterate over idxs i + 1 to length of input arr - 1, i_other
      - Append int at i_other - current int to differences
  - Convert differences to a hsh

- Generate an arr of all hsh's vals but absolute vals
- Find smallest val
- Iterate through hsh
  - Return a two-ele arr
    - First ele: key that has that samllest val
    - Second ele: key + smallest val
=end

# Original attempt
# Time spent: 41:01
def closest_numbers(arr)
  profiles = (
  arr.map.each_with_index do |n, i|
    diffs = []
    arr_temp = arr.dup
    arr_temp.delete_at(i)
    arr_temp.each do |n_next|
      diffs << (n_next - n)
    end
    [n, diffs]
  end).to_h

  diff_min = profiles.values.flatten.sort.min_by { |val| val.abs }

  first_ele = nil

  profiles.each do |k, v|
    if v.include?(diff_min)
      first_ele = k
      break
    end
  end

  second_ele = first_ele + diff_min

  [first_ele, second_ele]
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]
