=begin
Given 2 strings, your job is to find out if there is a substring that appears
in both strings. You will return true if you find a substring that appears in
both strings, or false if you do not.
We only care about substrings that are longer than one letter long.

Examples:
p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
=end

=begin
PEDAC
P
Input: Two strs
Output: A boolean of whether the two input strs share a substring that is
        longer than one character
        - Case-insensitive
        - Return false if both input strs are empty

E
p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

D
Input: Two strs
Intermediary: A str, arrs of strs potentially
Output: A boolean

A
- Convert both input strs to lowercase letters only versions of themselves
- Find the shorter input str
- Generate an arr of all the possible two-chars-and-more substrs of the
  shorter input str
  - Initialize an empty arr, substrs_shorter
  - Convert shorter str into an arr of chars
    - Iterate over indices of arr of chars
      - Iterate over 2 to (len of arr - current idx - 1) as n
      - Append substr of idx and len of current n to substrs_shorter
  - Return substrs_shorter
- Iterate over this arr of substrs (OR just use any?)
  - IF any of the substrss is contained by first input str
    - Return true immediately
- Return false
=end

=begin
# My attempt
def substring_test(str1, str2)
  str1 = str1.downcase
  str2 = str2.downcase

  if str1 == str2
    str_shorter = str1
    str_longer = str2
  else
    str_shorter = [str1, str2].min_by { |str| str.length }
    str_longer  = [str1, str2].select { |str| str != str_shorter}.first
  end

  substrs_shorter = []
  str_shorter.chars.each_index do |i|
    (2..(str_shorter.length - i)).each do |len|
      substrs_shorter << str_shorter[i, len]
    end
  end

  substrs_shorter.any? do |substr|
    str_longer.include?(substr)
  end
end
=end

=begin
Algorithm from video
- It only takes a single shared two-char substring to return true
- Therefore, iterate over first str with idx
  - Iterate over second str with idx
    - In each iteration, compare whether substr from str1 of idx to idx + 1 is
      the same as the substr from str2 of idx to idx + 1
      - Return true immediately if an equality is found
- Return false
=end

=begin
def substring_test(str1, str2)
  chars_str1 = str1.downcase.chars
  chars_str2 = str2.downcase.chars
  0.upto(chars_str1.length - 2) do |idx1|
    chars_str2.each_index do |idx2|
      if chars_str1[idx1, 2] == chars_str2[idx2, 2]
        return true
      end
    end
  end

  false
end
=end

# Improved version of my attempt
def substring_test(str1, str2)
  str1 = str1.downcase
  str2 = str2.downcase

  substrs = []
  str1.chars.each_index do |i|
    (2..(str1.length - i)).each do |len|
      substrs << str1[i, len]
    end
  end

  substrs.any? do |substr|
    str2.include?(substr)
  end
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
