=begin
Create a method that takes an array of integers as an argument and returns the
number of identical pairs of integers in that array. For instance, the number
of identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of
both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. For
instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The
first array contains two complete pairs while the second has an extra 2 that
isn't part of the other two pairs.

Examples:
p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

The above tests should each print true.
=end

=begin
PEDAC
P
Input: An arr of ints
Output: An int that is the num of pairs of same ints in the input arr
        - Return 0 if input arr is empty or if ther is only one int

E
p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

D
Input: An arr of ints
Output: An int

A
- Use #tally to create a hsh the keys of which are the ints and the vals are
  the nums of the associated ints
- Sum up all the vals integer-division by two
=end

# Original attempt
# Time spent: 06:52
def pairs(arr)
  arr.tally.values.map { |val| val / 2 }.sum
end
