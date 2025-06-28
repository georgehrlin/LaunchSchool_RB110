=begin
Create a method that takes a string of digits as an argument and returns the
number of even-numbered substrings that can be formed. For example, in the case
of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and
'2', for a total of 6 substrings.
end

If a substring occurs more than once, you should count each occurrence as a
separate substring.

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12

The above tests should each print true.
=end

=begin
PEDAC
P
Input: A str that is most likely a multi-digit int
Output: An int that is the total num of even nums that can be formed
        with digits in the input str without changing its ordering

E
p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12

D
Input: A str
Intermediary: An arr of strs/ints
Output: An int

A
- Find an arr of all the possible combos of digits of input str
  (substrs)
  - Iterate over input str with idx (i_start)
    - Iterate over 1 to (len of substr - i_start) (substr_len)
      - Append each substr starting from i_start with len
        (substr_len) to collection
  - Return collection
- Filter out into an arr of all the even substrs
  - Use #select
  - Use #to_i and #even? in block
- Return the num of even substrs
  - Use #count
=end

=begin
# Original attempt
# Time spent: 13:32
def even_substrings(str)
  all_substrs = (
    str.chars.each_index.with_object([]) do |i_start, result|
      (1..str.length - i_start).each do |substr_len|
        result << str[i_start, substr_len]
      end
    end)

  all_substrs.select { |substr| substr.to_i.even? }.count
end
=end

# Improved version after LSBot review
def even_substrings(str)
  str.chars.each_index.with_object([]) do |i_current, evens|
    (1..str.length - i_current).each do |substr_len|
      int_current = str[i_current, substr_len].to_i
      evens << int_current if int_current.even?
    end
  end.count
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
