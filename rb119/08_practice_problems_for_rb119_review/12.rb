=begin
Create a method that takes a string as an argument and returns true if the
string is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once.
For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram
since it uses every letter at least once. Note that case is irrelevant.

Examples:
p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true

The above tests should each print true.
=end

=begin
PEDAC
P
Input: A str that is most likely a sentence
Output: A boolean of whether the input str is a pangram
        - A pangram is a str that contains every leeter in the alphabet at least
          once

E
p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

D
Input: A str
Intermediary: An arr of strs
Output: A boolean

A
- Initialize an arr of strs of all the alphabetic letters
- Downcase the input str
- Iterate over every char of the downcased input str
  - Remove the current char from the arr of alphabetic letters
- Return whether the arr of alphabetic letters is empty
=end

# Original attempt
# Time spent: 07:39
def is_pangram(sentence)
  alphabet = ('a'..'z').to_a
  sentence.downcase.each_char do |char|
    alphabet.delete(char)
  end
  alphabet.empty?
end

# Second attempt (written after timer was stopped)
def is_pangram(sentence)
  # Don't forget to downcase sentence!
  ('a'..'z').all? { |char| sentence.downcase.include?(char) }
end
