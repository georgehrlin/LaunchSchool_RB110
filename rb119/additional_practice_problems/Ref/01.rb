=begin
Write a function groupAnagrams(words) that takes an array of words as input and
groups the anagrams together. Anagrams are words that have the same characters
but in a different order.

Your function should return an array of arrays, where each inner array
represents a group of anagrams. For words that do not have anagrams, they
should be grouped into an array together.

The order of the groups and the order of words within each group does not
matter.

Examples:
puts groupAnagrams(['listen', 'silent', 'enlist', 'hello', 'olhel'])
# Output: [['listen', 'silent', 'enlist'], ['hello', 'olhel']]

puts groupAnagrams(['abc', 'bca', 'cab', 'def', 'fed'])
# Output: [['abc', 'bca', 'cab'], ['def', 'fed']]

puts groupAnagrams(['cat', 'dig', 'tac', 'god', 'act'])
# Output: [['cat', 'tac', 'act'], ['dig', 'god']]
=end

=begin
PEDAC
P
Input: An arr of strs
Output: A two-level arr of arrs
        - Anagrams are words that contain the same chars but in a
          different order
        - Anagrams are grouped in their own subarrs
        - Strs that have no anagrams are grouped in a subarr
        - Ordering in the final arr does not matter

E
p groupAnagrams(['listen', 'silent', 'enlist', 'hello', 'olhel'])
# Output: [['listen', 'silent', 'enlist'], ['hello', 'olhel']]

p groupAnagrams(['abc', 'bca', 'cab', 'def', 'fed'])
# Output: [['abc', 'bca', 'cab'], ['def', 'fed']]

p groupAnagrams(['cat', 'dig', 'tac', 'god', 'act'])
# Output: [['cat', 'tac', 'act'], ['dig', 'god']]

p groupAnagrams(['listen', 'cat', 'dig', 'silent', 'tac', 'god', 'enlist', 'act'])
# Output: [["listen", "silent", "enlist"], ["cat", "tac", "act"], ["dig", "god"]]

D
Input: An arr of strs
Intermediary: Arrs and strs
Output: An arr of subarrs of strs

A
HELPER: anagram?(str1, str2)
- str1.sort == str2.sort

- Initialize an arr, groups, that contains one empty subarr
- Iterate over input arr
  - IF the arr of calling flatten on groups does not contain current str
    - Use select to find the arr of all the anagrams of current str
      - If the size of the arr of anagrams is 1
        - Append current str to last subarr in groups
      - Else
        - Prepend this arr to groups
- Return groups
=end

# Original attempt
# TIme spent ~35 minutes
def anagrams?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def groupAnagrams_0(strs)
  groups = [[]]

  strs.each do |str1|
    if !groups.flatten.include?(str1)
      anagrams = strs.select { |str2| anagrams?(str1, str2) }
      if anagrams.size == 1
        groups.last << str1
      else
        groups.prepend(anagrams)
      end
    end
  end

  groups.delete_at(-1) if groups.last.empty?
  groups
end

def groupAnagrams_1(strs)
  multiples, singles = (strs.partition do |str1|
                          strs.count { |str2| anagrams?(str1, str2) } > 1
                        end)

  groups = []

  multiples.each do |str1|
    if !groups.flatten.include?(str1)
      group = []
      multiples.each do |str2|
        group << str2 if anagrams?(str1, str2)# && !groups.flatten.include?(str2)
      end
      groups << group
    end
  end

  groups << singles if !singles.empty?
  groups
end

# Solution by ChatGPT 04-mini-high
def groupAnagrams_2(words)
  grouped = words.group_by { |word| word.chars.sort.join }.values
  singles, anagram_groups = grouped.partition { |group| group.size == 1 }
  anagram_groups << singles.flatten unless singles.empty?

  anagram_groups
end
