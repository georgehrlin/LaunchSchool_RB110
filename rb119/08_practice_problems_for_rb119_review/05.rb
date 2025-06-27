=begin
Create a method that takes a string argument and returns the character that
occurs most often in the string. If there are multiple characters with the same
greatest frequency, return the one that appears first in the string. When
counting characters, consider uppercase and lowercase versions to be the same.

Examples:
p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'

The above tests should each print true.
=end

=begin
PEDAC
P
Input: An str
Output: A single-char str that is the char that appears most often in input str
        - Case-insensitive
        - Return str is always lowercase

E
p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'

D
Input: A str
Intermediary: An arr of strs
Output: A str

A
- Convert input str to lowercase
- Convert input str to arr of chars
- Return the char that appears most often in the arr
  - Return the first if more than one char appears with the most number of
    times
    - Find the first char with the highest number of appearance
    - Return it immediately, terminating the iteration
      - Determine the number of highest appearance
      - Return the first number with which cout returns that number
=end

=begin
# Original attempt
# Time spent: 15:17
def most_common_char(str)
  chars = str.downcase.chars
  n_most_appearance = chars.map { |char| chars.count(char) }.max
  char_most_appearance = ''

  chars.each do |char|
    if chars.count(char) == n_most_appearance
      char_most_appearance = char 
      break
    end
  end

  char_most_appearance
end
=end

# Suggested by LSBot
def most_common_char(str)
  chars = str.downcase.chars
  char_counts = Hash.new(0)

  chars.uniq.each do |char|
    char_counts[char] = chars.count(char)
  end

  max_count = char_counts.values.max
  chars.find { |char| char_counts[char] == max_count }
end
