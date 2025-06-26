=begin
FORMING ANAGRAMS
From 20240514 study session

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
P
Input: Two strs
Output: An int that is the total number of letters that need to be removed from
        the two inputs strs in order for the strs to become anagrams

E
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

D
Input: Two strs
Intermediary: An arr of strs potentially
Output: An int

A
WRONG
- Convert str1 and str2 to arrs of chars
- Initialize a counter, n_removed, with val 0
- Iterate over chars1
  - 
  - Increment n_removed by 1 if current char is not included by chars2
- Iterate over chars2
  - Increment n_removed by 1 if current char is not included by chars1
- Return n_removed

FIXED
- Convert str1 and str2 to arrs of chars
- Initialize a counter, n_removed, with val 0
- Iterate over chars1
  - IF current char is not included by chars2
    - Increment n_removed by 1
  - ELSE
    - Remove that char from chars2
- Iterate over chars2
  - Increment n_removed by 1 if current char is not included by chars1
- Return n_removed

NEW
- Convert str1 and str2 to arrs of chars
- Use #tally and #sort on both arrs to generate hsh1 and hsh2
- Initialize a couter, n_removed, with val 0
- Iterate over keys of hsh1
  - IF current key is also included in hsh2
    - Increment n_removed by the abs val of hsh1[k] - hsh2[k]
  - ELSE
    - Increment n_removed by the val of hsh1[k]
- Iterate over keys of hsh2
  - IF current key is not included in hsh1
    - Increment n_removed by the val of hsh2[k]
- Return n_removed

NOTE
The general idea here is:
- For each char that can be found in both strs
  - Find the difference between the numbers of that char in both strs and add
    that difference to counter
    - ONLY do this entire process once because doing it once already covers
      accounting for all the differences between shared chars
- For chars not foud in both strs
  - Do this with each of the two strs
    - Increment couter whenever such char is found
=end

# NEW
def anagram_difference(str1, str2)
  hsh1 = str1.chars.tally
  hsh2 = str2.chars.tally

  n_removed = 0

  hsh1.each_key do |k|
    if hsh2.keys.include?(k)
      n_removed += (hsh1[k] - hsh2[k]).abs
    else
      n_removed += hsh1[k]
    end
  end

  hsh2.each_key do |k|
    n_removed += hsh2[k] if !hsh1.keys.include?(k)
  end

  n_removed
end

=begin
# WRONG
def anagram_difference(str1, str2)
  chars1 = str1.chars
  chars2 = str2.chars

  n_removed = 0

  chars1.each { |char| n_removed += 1 if !chars2.include?(char) }
  chars2.each { |char| n_removed += 1 if !chars1.include?(char) }

  n_removed
end
=end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0 
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2 
p anagram_difference('a', 'aab') == 2 
p anagram_difference('codewars', 'hackerrank') == 10 
p anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42
p anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50
