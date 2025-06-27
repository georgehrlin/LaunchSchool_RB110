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
Input: A str that is likely a sentence
Output: A single-char str that is the char that appears the most in input str
        - Return the one that appears first if multiple such char exists

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
Output: A str

A
- Convert input str to lowercase
- Initialize a counter, max_occurence, with val Integer::INFINITY
- Iterate over arr of chars of input str
  - Use count to find num of occurence of current char
  - Reassign max_occurence to count of current char if count of current char is
    smaller than max_occurence
- Return the first char with max_occurence
=end

def most_common_char(str)
  downcased = str.downcase
  current_max_char = nil
  max_occurence = 0
  downcased.chars.each do |char|
    if downcased.count(char) > max_occurence
      max_occurence = downcased.count(char)
      current_max_char = char
    end
  end

  current_max_char
end

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'
