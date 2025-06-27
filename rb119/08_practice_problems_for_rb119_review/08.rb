=begin
Create a method that takes a non-empty string as an argument. The string
consists entirely of lowercase alphabetic characters. The method should return
the length of the longest vowel substring. The vowels of interest are "a", "e",
"i", "o", and "u".

Examples:
p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5

The above tests should each print true.
=end

=begin
PEDAC
P
Input: A str of only lowercase alphabetic chars
Output: An int that is the length of the longest substr consists of entirely
        vowels
        - Vowels: aeiou

E
p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5

D
Input: A str
Output: An int

A
HELPER: Find all possible substrs
- Find an arr of all the possible substrs of input str
  - Iterate from first char to last with idx (i_start)
    - Use length of str.length - i_start
      - Append substr of [i_start, str.length - i_start]

- Filter out an arr of substrs consists of only vowels
- Find the longest substr within this arr and return its length

- Require a HELPER method to check if a str is all vowels
- Use #max_by, #count
=end

# Original attempt
# Time spent: 26:30
VOWELS = ['a', 'e', 'i', 'o', 'u']

def all_substrs(str)
  str.chars.each_index.with_object([]) do |i, substrs|
    (1..str.length - i).each do |substr_len|
      substrs << str[i, substr_len]
    end
  end
end

def longest_vowel_substring(str)
  substrs = all_substrs(str)
  substrs_vowels = (substrs.select do |substr| 
                      substr.chars.all? do |char|
                        VOWELS.include?(char)
                      end
                    end)
  return 0 if substrs_vowels.empty?
  substrs_vowels.max_by { |substr| substr.length }.length
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5
