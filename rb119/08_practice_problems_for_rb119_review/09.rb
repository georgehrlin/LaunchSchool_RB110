=begin
Create a method that takes two string arguments and returns the number of times
that the second string occurs in the first string. Note that overlapping
strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.

Examples:
p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

The above tests should each print true.
=end

=begin
PEDAC
P
Input: Two strs
Output: An int that is the num of times 2nd str appears in 1st str
        without overlapping
        - Return 0 if 2nd str is not found in 1st str

E
p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

D
Input: Two strs
Intermediary: An arr of strs potentially
Output: An int

A
- Maybe a guard clause first with include? to return 0
- Initialize a counter with val 0
- Iterate over 1st str from idx 0
  - Extract a substr that is the same len as 2nd str
  - Increment counter by 1 if substr == 2nd str
- Return counter
=end

=begin
# Original attempt
# Time spent: ~27 minutes
def count_substrings(str1, str2)
  counter = 0
  i_start = 0

  loop do
    break if i_start >= str1.length - (str2.length - 1)
    if str1[i_start, str2.length] == str2
      counter += 1
      i_start += str2.length
    else
      i_start += 1
    end
  end

  counter
end
=end

# After learning the existence of str.scan
def count_substrings(str1, str2)
  str1.scan(str2).count
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1
