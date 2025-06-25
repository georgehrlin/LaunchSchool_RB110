=begin
Given an array of strings made only from lowercase letters, return an array of
all characters that show up in all strings within the given array (including
duplicates).
For example, if a character occurs 3 times in all strings but not 4 times, you
need to include that character three times in the final answer.

Examples:
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello","goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
=end

=begin
PEDAC
P
Input: An array of strings of lowercase letters only
Output: An array of individual single-letter strings that are the letters
        shared by all element strings in the input array

E
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello","goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

D
Input: An arr of strs
Output: An arr of strs

A
- Intialize an empty result arr
- Iterate over every char str of first element str
  - IF all element strs include current char str
    - Append it to result arr
    - Remove first occurence of char from all of the rest of the element strs
- Return result arr
=end

=begin
# First attempt
def remove_first_occurrence(str, char_target)
  characters = str.chars
  characters.each_index do |idx|
    if characters[idx] == char_target
      characters.delete_at(idx)
      break
    end
  end

  characters.join
end

def common_chars(arr)
  result = []
  arr.first.each_char do |char|
    result << char if arr.all? { |str| str.include?(char) }
    1.upto(arr.length - 1) do |idx|
      arr[idx] = remove_first_occurrence(arr[idx], char)
    end
  end

  result
end
=end

=begin
# Modified after viewing video
def common_chars(arr)
  result = []
  arr.first.each_char do |char|
    result << char if arr.all? { |str| str.include?(char) }
    1.upto(arr.length - 1) do |idx|
      arr[idx].sub!(char, '')
    end
  end

  result
end
=end

# Solution from video
def common_chars(arr)
  arr = arr.map { |string| string.dup }

  arr.first.each_char.select do |char|
    arr.all? { |string| string.sub!(char, '') }
  end
end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello","goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
