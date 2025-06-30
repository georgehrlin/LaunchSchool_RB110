=begin
Create a method that takes an array of integers as an argument and returns the
integer that appears an odd number of times. There will always be exactly one
such integer in the input array.

Examples:
p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0

The above tests should each print true.
=end

=begin
# Original attempt
# Time spent: 01:12
def odd_fellow(arr)
  arr.find { |n| arr.count(n).odd? }
end
=end

# Alternative solution suggested by LSBot
def odd_fellow(arr)
  arr.tally.find_all { |n, count| count.odd? }.first
end
