# This file is my attempt to solve Problem 2 in this assignment on my own

=begin
PROBLEM 2:

Given a string, write a method `palindrome_substrings` which returns all the
substrings from a given string which are palindromes. Consider palindrome words
case-sensitive.

Test cases:
palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []
=end

=begin
(Understand the) Problem

Input: String
Output: Array of strings
Rules:
  Explicit requirements:
    - Output must include ALL the substrings that are palindromes, even the
      substrings of substrings
    - Palindromes are case-sensitive (i.e., 'Aba' is not a palindrome)

  Implicit requirements:
    - When given an empty string, method returns an empty array
    - Can be assumed that all inputs are strings
=end

=begin
Algorithm (My Own Attempt)

1. Begin a set of iterations: First check if the first two characters make up a
   substring that is a palindrome; then, check if the first three characters
   make up a substring that is a palindrome; continue this iteration of checking
   by expanding the substring in this order until the substring being checked is
   the entire argument string.
2. Then, begin a second set of iterations: Repeat the general pattern of
   checking in the first set of iterations but ignore the first character and
   begin with the second character of the argument string.
3. Begin a third set of iterations, repeating the same pattern of checking. Keep
   repeating this pattern of checkingif there are characters available.
4. End all iterations when the set begins with the last character of the
   argument string.
=end

def palindrome_substrings(s)
  result = []
  counter = 0
  substr_len = 2

  loop do
    break if counter + 1 >= s.length

    loop do
      substr = s[counter, substr_len]
      result << substr if substr == substr.reverse
      substr_len += 1
      break if (counter + substr_len >= s.length)
    end

    counter += 1
    substr_len = 2
  end

  result
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []