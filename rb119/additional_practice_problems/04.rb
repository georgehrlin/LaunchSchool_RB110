=begin
MAXIMUM NUMBER BY DELETING ONE
From 20240514 study session

Given an integer n, find the maximal number you can obtain by deleting exactly
one digit of the given number.

delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1
=end

=begin
PEDAC
P
Input: An int
Output: An int that is the largest possible integer with a digit removed from
        input int
        - Order remains the same after deletion

E
delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1

D
Input: An int
Intermediary: Arrs of ints potentially
Output: An int

A
- Generate an arr of ints that are all the possible ints with one digit removed
  - Generate an arr of digits of input int  with #digits and #reverse
  - Iterate over this arr of digits with object (assign this object to
    all_possible_ints)
    - Make a copy of arr of digits
    - Remove digit at current idx
    - Join this arr and convert it to int
    - Append this int to all_possible_ints
  - Return all_possible_ints
- Return the largest ele in all_possible_ints
=end

def delete_digit(int)
  digits = int.digits.reverse

  all_possible_ints = (
    digits.each_index.with_object([]) do |i, result|
      current_digits = digits.dup
      current_digits.delete_at(i)
      result << current_digits.join.to_i
    end)

  all_possible_ints.max
end

p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
