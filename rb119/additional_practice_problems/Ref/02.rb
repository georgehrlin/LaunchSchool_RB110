=begin
You will be given a number and you will need to return it as a string in
expanded form.

For example:
expanded_form(12); # Should return '10 + 2'

Examples:
p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
=end

=begin
PEDAC
P
Input: An int
Output: A str that is a formula of additions of numbers that add up to
        input int
        - Each num contains either a digit from input int or 0

E
p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

D
Input: An int
Intermediary: Ints, strs, maybe arr
Output: A str

A
- Use % to find the next num to be added
- Determine the tenth of the current int
- Use this tenth to determine the modulo
  - E.g., if the num to be divided is 4321, the modulo is 1000
- Retain the first digit
- Append th number of zeors

- Initialize an empty arr to collect each number that goes into the
  addition

- Determine how many zeros
  - Size of num str - 1
70304
- Keep the first digit, add 4 zeros to it, append it to final arr
- 70304 % 10000 # => 304 (next number)

304
- Keep the first digit, add 2 zeros to it, append it to final arr
- 304 % 100 # => 4

4
- Keep the first digit, add 0 zeros to it, append it to final arr
- 4

- Join final arr with ' + '
=end

def expanded_form(num)
  valid_nums = []

  while num.digits.size > 1
    modulo = 10 ** (num.digits.size - 1)
    valid_nums << num.to_s.chars.first + '0' * (num.digits.size - 1)
    num %= modulo
  end

  valid_nums << num.to_s

  valid_nums.join(' + ')
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
