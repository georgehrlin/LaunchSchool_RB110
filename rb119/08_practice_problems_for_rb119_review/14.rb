=begin
Create a method that takes a single integer argument and returns the sum of all
the multiples of 7 or 11 that are less than the argument. If a number is a
multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and
22. The sum of these multiples is 75.

If the argument is negative, return 0.

Examples:
p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

The above tests should each print true.
=end

=begin
PEDAC
P
Input: An int
Output: An int that is the sum of all the multiples of 7 or 11 that are smaller
        than the input int
        - When a num is a multiple of both 7 and 11, count it once

E
p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

D
Input: An int
Output: An int

A
- Initialize a sum tracker, sum_7_11, with val 0
- Iterate over a range of 1 to input int, not inclusive
  - IF current num is a multiple of 7 or a multiple of 11
    - Increment sum_7_11 by current num
- Return sum_7_11
=end

=begin
# Original attempt
# Time spent: 07:23
def seven_eleven(n)
  sum_7_11 = 0
  (1...n).each do |n_current|
    if n_current % 7 == 0 || n_current % 11 == 0
      sum_7_11 += n_current
    end
  end

  sum_7_11
end
=end

# Not timed
def seven_eleven(int)
  (1...int).select { |n| n % 7 == 0 || n % 11 == 0 }.sum
end

# Improved after LSBot review
def seven_eleven(int)
  (1...int).select { |n| (n % 7).zero? || (n % 11).zero? }.sum
end
