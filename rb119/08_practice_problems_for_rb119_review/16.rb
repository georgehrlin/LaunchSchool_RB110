=begin
Create a method that returns the count of distinct case-insensitive alphabetic
characters and numeric digits that occur more than once in the input string.
You may assume that the input string contains only alphanumeric characters.

Examples:
p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

The above tests should each print true.
=end

=begin
PEDAC
P
Input: A str of only alphanumeric chars
Output: An int that is the total count of alphanumeric chars that occur more
        than once in input str

E
p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

D
Input: A str
Intermediary: An arr of strs
Ouput: An int

A
- Initialize a constant that is an arr of all the alphanumeric chars
- Convert input str into arr of downcased char strs
- Select out all the chars in input str that occur more than once and are
  alphanumeric
  - Current char is included in the all alphanumeric chars arr
- Sum up the total num of unique chars in this arr
=end

# Original attempt
# Time spent: 13:52
ALPHANUMERIC = ('a'..'z').to_a + ('0'..'9').to_a

def distinct_multiples(str)
  chars = str.downcase.chars
  chars.select do |char|
    chars.count(char) > 1 && ALPHANUMERIC.include?(char)
  end.uniq.count
end

# Improved approach after LSBot review
# Not timed 
def distinct_multiples(str)
  char_count = str.downcase.chars.tally
  char_count.count { |k, v| v > 1}
end

# NOTE: Checking if current char is alphanumeric is unnecessary beacause the
# problem already stated that input str only contains alphanumeric cahars
