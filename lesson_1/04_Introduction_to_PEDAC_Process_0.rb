=begin
PROBLEM 1:

Given a string, write a method `change_me` which returns the same string but
with all the words in it that are palindromes uppercased.

Test cases:
change_me("We will meet at noon") == "We will meet at NOON"
change_me("No palindromes here") == "No palindromes here"
change_me("") == ""
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
=end

=begin
(Understand the) Problem
Input: String
Output: A new string
Rules:
  Explicit requirements:
    - Every palindrome in the string must be converted to uppercase. (A
      palindrome is a word that reads the same forwards and backwards
    - Palindromes are case-sensitive ("Dad" is not a palindrome, but "dad" is).

  Implicit requirements:
    - The returned string must be a new string object
    - If the string is an empty string, the result should be an empty string
    - We can assume all inputs are only strings
=end

=begin
PROBLEM 2:

Given a string, write a method `palindrome_substrings` which returns all the
substrings from a given string which are palindromes. Consider palindrome words
case-sensitive.

Test cases:
palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []
=end

=begin
(Understand the) Problem

Input: String
Output: Array of strings
Rules:
  Explicit requirements:
    - Output must include ALL the substrings that are palindromes, even the
      substrings of substrings
    - Palindromes are case-sensitive

  Implicit requirements:
    - When given an empty string, method returns an empty array
    - Palindrome substrings of longer palindrome substrings must also be
      included individually (test case #2)
    - Can be assumed that all inputs are strings
=end

=begin
Algorithm

1 Initialize a result variable that references an empty array
2 Create an array named `substring_arr` that contains all of the susbtrings of
   the input string that are at least 2-character long
3 Loop through the words in the `substring_arr` array
4 If the word is a palindrome, append it to the result array
5 Return the result array

This algorithm is not good enough because it is missing the "implementation
details" of the most difficult parts (step 2).
=end

=begin
Draft Code

def palindrome_substrings(str)
  result = []
  substring_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end
=end

=begin
Algorithm Draft for `substrings(str)`

For each starting index from 0 through the next to last index position
  - For each substring length from 2 until there are no substrings of that
    length 
    * Extract the substring of the indicated length starting at the indicated
      index position
  - End of inner loop
End of Outer loop
=end

=begin
Algorithm Complete for `substrings`

- Create an empty array called `result` that will contain all required
  substrings
- Create a `starting_index` variable (value `0`) for the starting index of a
  substring
- Start a loop that iterates over `starting_index` from `0` to the length of the
  string minus 2
  * Create a `num_chars` variable (value `2`) for the length of a substring
  * Start an inner loop that iterates over `num_chars` from `2` to
    `string.length - starting_index`
    - Extract a substring of length `num_chars` from `string` starting at
      `starting_index`
    - Append the extracted substring to the `result` array
    - Increment the `num_chars` variable by `1`
  * End the inner loop
  * Increment the `starting_index` variable by `1`
- End the outer loop
- Return the `result` array

Formal Pseudocode for `substrings`
START

  /* Given a string named `string` */

  SET result = []
  SET starting_index = 0

  WHILE starting_index <= length - 2
    SET num_chars = 2
    WHILE num_chars <= length of string - starting_index
      SET substring = num_chars characters from string starting at index starting_index
      Append substring to result array
      SET num_chars = num_chars + 1

    SET starting_index = starting_index + 1

  RETURN result

END
=end

Code with Intent for `substrings`

def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str[starting_index, num_chars]
      result << substring
      num_chars += 1
    end

    starting_index += 1
  end

  result
end