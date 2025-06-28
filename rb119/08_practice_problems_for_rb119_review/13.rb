=begin
Create a method that takes two strings as arguments and returns true if some
portion of the characters in the first string can be rearranged to match the
characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic
characters. Neither string will be empty.

Examples:
p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true

The above tests should each print true.
=end

=begin
PEDAC
P
Input: Two single-word strs consisting of only lowercase alphabetic chars
Output: A boolean of whether some portion of the first input str can be
        rearranged to match the second input str
        - Neither str is empty

E
p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true

D
Input: Two strs
Intermediary: An arr of strs
Output: A boolean

A
# WRONG
- Create an arr of all the possible substrs of first input str
  - Iterate over first input str with index (i_start) and object ([]) (substrs)
    - substr_len: Iterate over 1 to (len of str1 - i_start)
      - Append substr from i_start with len substr_len to substrs
- Return if any of the strs in this substrs arr, once sorted, is the same as
  the second input str also sorted
  - substrs.any? { |substr| substr.chars.sort == str2.chars.sort }
=end

=begin
# Original first attempt
# WRONG
def unscramble(str1, str2)
  str1.chars.each_index.with_object([]) do |i_start, substrs|
    (1..str1.length - i_start).each do |substr_len|
      substrs << str1[i_start, substr_len]
    end
  end.any? { |substr| substr.chars.sort == str2.chars.sort }
end
=end

# Second attempt
# Written immediately after realizing first attempt is wrong
def unscramble(str1, str2)
  # Original
  # str2.chars.all? { |char| str2.count(char) == str1.count(char) }
  # Fixed
  str2.chars.all? { |char| str2.count(char) <= str1.count(char) }
end

# Time spent (total, both attempts included): 16:25

=begin
NOTE

Technically the second solution was incomplete. It would return the wrong bool
val if str1 contained more of a char that showed up in str2. The fix is simple.
The comparison of the two count return values needs to be <=.
=end
