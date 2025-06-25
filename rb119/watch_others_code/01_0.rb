=begin
Given a non-empty string, check if it can be constructed by taking a substring
of it and appending multiple copies of the substring together. You may assume
the given string consists of lowercase English letters only.

Examples:
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
=end

=begin
PEDAC
P
Input: A string of lower English letters only
Output: A boolean of whether the input string consits of repeating substrings

E
p repeated_substring_pattern("aaa")  == true
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true

D
Input: A string
Output: A boolean

A
Analysis
- For a valid input string with repeating patterns
  - The total number of characters has to be a multiple of the number of chars
    of the unit substring
  - Maximum length of unit substring is half the length of input string

- Given an input string of length n
- Start checking substring from index 0 and of legnth 1, up to of length n / 2
- Skip iteration if input string len cannot fully divide substring len
- Return true immediately if any of the substring in iteration can form the
  input string by duplicating itself by input string length / substring length
- Return false if iteration finishes
=end

require 'pry'

def repeated_substring_pattern(str)
  1.upto(str.length / 2) do |n|
    next if str.length % n != 0
    return true if str[0, n] * (str.length / n) == str
  end
  false
end

p repeated_substring_pattern("aaa")  == true
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
