=begin
Write method scramble(str1, str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise returns false.
Only lowercase letters will be used (a to z). No punctuation or digits will be
included.

For example:
str1 is 'rkqodlw' and str2 is 'world'. The output should be true.
str1 is 'cedewaraaossoqqt' and str2 is 'codewars'. The output should be true.
str1 is 'katas' and str2 is 'steak'. The output should be false.

Examples:
p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
=end

=begin
PEDAC
P
Input: Two strs
Output: A boolean of whether str2 can be constructed by a combination of some 
        chars from str1
        - Only lowercase letters
        - No punctuation or digits

E
p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

D
Input: Two strs
Intermediary: Arrs of strs potentially
Output: A boolean

A
WRONG:
- Convert str1 and str2 to arrs of chars
- Sort arrays of str1 chars and str2 chars
- Generate an arr of all the possible subarrs of arr str1 chars
- Return a boolean of whether any of the str1 subarrs match str2 chars

FIX:
- Convert str1 and str2 to arrs of chars
- Initailize a true flag
- Iterate over chars of str2
  - IF current char is not foud in chrs of str1
    - Return false immediately
  - ELSE
    - Delete one occurence (first occurence) of current char from chars of str1
- Return flag
=end


# My attempt
def scramble(str1, str2)
  chars1 = str1.chars
  chars2 = str2.chars

  chars2.each do |char2|
    if !chars1.include?(char2)
      return false
    else
      chars1.delete_at(chars1.index(char2))
    end
  end

  true
end

# Attempt from video
# Basically, IF any char in str2 appears more than once in str1, return false
# immediately; ELSE, return true
def scramble(str1, str2)
  chars2 = str2.chars
  chars2.each do |char2|
    return false if str2.count(char2) > str1.count(char2)
  end

  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

=begin
# WRONG: If str1 is longer, some letters can "get in the way" of some subarrs
# of str1 chars

def scramble(str1, str2)
  p chars1 = str1.chars
  p chars2 = str2.chars

  p chars1.sort!
  p chars2.sort!

  chars1_subarrs = []
  chars1.each_index do |i_start|
    (i_start...chars1.length).each do |i_end|
      chars1_subarrs << chars1[i_start..i_end]
    end
  end

  p chars1_subarrs
  p chars2

  chars1_subarrs.any? { |subarr| subarr == chars2 }
end
=end
