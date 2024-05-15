=begin
Given two words, how many letters do you have to remove from them to make them
  anagrams?

anagram_difference('', '') == 0
anagram_difference('a', '') == 1
anagram_difference('', 'a') == 1
anagram_difference('ab', 'a') == 1
anagram_difference('ab', 'ba') == 0 
anagram_difference('ab', 'cd') == 4
anagram_difference('aab', 'a') == 2 
anagram_difference('a', 'aab') == 2 
anagram_difference('codewars', 'hackerrank') == 10 
anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42
anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50
=end

=begin
PEDAC

Input: Two strings
Output: An integer that indicates how many letters need to be removed from the
        two argument strings in total for the two strings to become anagrams of
        each other

Rules:
- Anagrams are words that contain the same letters but in indifferent orders
- An empty string is considered an anagram of an empty string

Algorithm:
- Split first string into an array
- Split second string into an array
- Compare the lengths of the arrays
  - Assign the shorter array to a variable, `short`
  - Assign the longer array to a variable, `long`
- Create a counter that tracks the number of letters to be removed
- Loop over `long` array
  - Determine if both `short` and `long` contain the letter being iterated
    - If yes
      - Select out the sub-array from `short` that consists of the letter
      - Select out the sub-array from `long` that consists of the letter
      - Subtract the length of `long` sub-array from `short` sub-array and add
        it to the counter
    - If no
      - Select out the sub-array from `long` that consists of the letter
      - Determine the length of the sub-array and add it to the counter
- Return counter
=end

def anagram_difference(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  counter = 0

  if arr1.length > arr2.length
    long = arr1
    short = arr2
  else
    long = arr2
    short = arr1
  end

  p "Shorter is #{short}"
  p "Longer is #{long}"

  long.each do |char|
    if long.include?(char) && short.include?(char)
      short_sub = short.select { |letter| letter == char }
      p short_sub
      long_sub = long.select { |letter| letter == char }
      p long_sub
      counter += (long_sub.length - short_sub.length)
    else
      long_sub = long.select { |letter| letter == char }
      counter += long_sub.length
    end
  end

  counter
end

#p anagram_difference('', '') == 0
#p anagram_difference('a', '') == 1
#p anagram_difference('', 'a') == 1
#p anagram_difference('ab', 'a') == 1
#p anagram_difference('ab', 'ba') == 0 
#p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2 
#p anagram_difference('a', 'aab') == 2 
#p anagram_difference('codewars', 'hackerrank') == 10 
#p anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42
#p anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50