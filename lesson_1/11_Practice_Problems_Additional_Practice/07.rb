=begin
PEDAC

Input: A string
Output: A hash with every inidividual character of the input string as keys, and
        the number of occurrences of the key character as values
Requirement:
  - I am not sure if the empty string qualifies as a key in the final hash. The
    example does not clarify it and there is no way for me to know. I am
    assuming yes because I don't think this is  a big deal.

Example:
statement = "The Flintstones Rock"

char_counter(statement) # => { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

Data Structure:
- Input is a string
- Output is a hash

Algorithm:
- Create an empty hash that functions as final return hash
- Split input string into an array of individual characters
- Loop over characters
  - Create a counter that tracks occurences of character
  - Loop over characters
    - If current character in inner loop is same as current character of outer
      loop, counter increments by 1
  - Assign character and counter as key-value pair to final hash
- Return final hash
=end

=begin
def char_counter(str)
  result = {}

  str.chars.each do |char_outer|
    counter = 0
    str.chars.each do |char_inner|
      counter += 1 if char_inner == char_outer
    end
    result[char_outer] = counter
  end

  result
end

statement = "The Flintstones Rock"

p char_counter(statement)
=end

# Official Solution
statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

=begin
Notes
- Official solution arranges final hash keys in alphabetical order
- Official solution does not count the occurences of empty string
- `('A'..'Z').to_a` and `('a'..'z')to_a` are ways to create arrays of alphabet
- Remember `String#count`
=end

# Refractor my solution using String#count
def char_counter(str)
  result = {}

  str.chars.each do |char|
    counter = str.count(char)
    result[char] = counter
  end

  result.sort.to_h
end

statement = "The Flintstones Rock"

p char_counter(statement)