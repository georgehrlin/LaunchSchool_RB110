=begin
Find the length of the longest substring in the given string that is the same
in reverse.

For example, if the input was "I like racecars that go fast", the substring
("racecar") length would be 7.

If the length of the input string is 0, the return value must be 0.

Examples:
p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 2
p longest_palindrome("baablkj12345432133d") == 9
=end

=begin
PEDAC
P
Input: A str
Output: An int that is the length of the longest palindrome substr in input 
        str
        - 0 if the longest palindrome substr is ''

E
p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9

D
Input: A str
Output: An int

A
- Generate an arr of all possible substrs of input str
  - Iterate over each char of input str with idx; use as starting idx
    - Iterate over idxs from starting idx to last idx; use as ending idx
      - Append each substr from starting to ending idxs to a substrs arr
- Select out an arr of all palindromes
  - Select criterion is whether str is the same as str reversed
- Find the longest palindrome substr
  - Use #max_by and #length
- Return this palindrome substr's length
=end

def longest_palindrome(str)
  substrs = (
    str.chars.each_index.with_object([]) do |i_start, substrs|
      (i_start...str.length).each do |i_end|
        substrs << str[i_start..i_end]
      end
    end)
  palindromes = substrs.select { |substr| substr == substr.reverse }
  palindromes.max_by { |palindrome| palindrome.length }.length
end

p longest_palindrome("a") # == 1
p longest_palindrome("aa") # == 2
p longest_palindrome("baa") # == 2
p longest_palindrome("aab") # == 2
p longest_palindrome("baabcd") # == 4
p longest_palindrome("baablkj12345432133d") # == 9
