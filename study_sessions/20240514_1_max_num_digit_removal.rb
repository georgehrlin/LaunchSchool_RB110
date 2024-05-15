=begin
Given an integer n, find the maximal number you can obtain by deleting exactly
one digit of the given number.

delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1
=end

=begin
PEDAC

Input: An integer number
Output: An integer number that is the largest possible integer after deleting
        one digit from input integer

Rules:
- Digit to be deleted can be at any position
- Order of digits must always remain

Data Structure:
- Input is integer
- Integer converted to aray of digits for processing
- After processing, array is combined into integer again
- Output is integer

Algorithm:
- Split input integer into an array of digits
- Create a collector array that collects possible integers after a digit is
  removed
- Loop over the digits
  * Create the integer with the digit being iterated removed
  * Append the processed integer to collector array
- Return the maximal number from the collector array
=end

def delete_digit(n)
  arr_original = n.to_s.chars
  collector = []

  arr_original.each do |digit|
    arr_copy = arr_original.difference
    arr_copy.delete_at(arr_copy.index(digit))
    collector << arr_copy.join.to_i
  end

  collector.max
end

=begin
Some General Questions:
1. Can I refer to the Ruby docs during the assessment? I am guessing no.
2. Is it OK that I refer to the docs when I practice on my own? I think I cannot
   come to some solutions if I can't.
3. I am still very new to these PEDAC sessions. I am supposed to mute the
   meeting when the TA is going through the approaches with others so that I
   don't get "spoiled", right?
=end

p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1