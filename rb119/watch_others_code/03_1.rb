=begin
Write a method to find the longest common prefix string amongst an array of
strings. All given inputs are in lowercase letters a to z.
If there is no common prefix, return an empty string "".

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"
=end

=begin
PEDAC
P
Input: An arr of strs
Output: A str that contains the starting characters shared by all element strs
        of the input arr
        - Therefore, an empty str is returned if there is no shared starting
          characters

E
p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

D
Input: An arr of strs
Intermediary: A str
Output: A str

A
- HELPER: Check if all element strs of an arr share the same char at a
  specific index
  - Initialize a true flag, shared
  - Iterate through all element strs in an arr
    - IF the char at such idx of a str is different
      - Set flat to false and return it immediately
  - Return flag

- Initialize an empty str, shared_prefix
- Find the shortest element str in input arr
- Iterate through the chars of this shortest str with idx
  - Check if all the element strs share the same char at current idx (HELPER)
    - IF yes, append to shared_prefix
    - ELSE, terminate iteration immediately
- Return shared_prefix
=end
def shared_by_all?(arr, char, i)
  arr.all? { |str| str[i] == char }
end

# p shared_by_all?(["flower", "flow", "flight"], 'l', 1) # true
# p shared_by_all?(["flower", "flow", "flight"], 'l', 0) # false
# p shared_by_all?(["flower", "flow", "flight"], 'o', 2) # false


def common_prefix(arr)
  shared_prefix = ''
  str_shortest = arr.min_by { |str| str.length }
  str_shortest.chars.each_with_index do |char, i|
    if shared_by_all?(arr, char, i)
      shared_prefix << char
    else
      return shared_prefix
    end
  end

  shared_prefix
end

p common_prefix(["flower", "flow", "flight"])
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"
