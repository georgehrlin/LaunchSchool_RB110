# INFORMAL PSEUDOCODE

Input: A string
Output: An array of substrings
Rules: Palindrome words should be case-sensitive, meaning "abBA" is not a palindrome

## Algorithm:
### `substrings`
* Create an empty array called `result` that will contain all required substrings
* Create a `starting_index` variable (value `0`) for the starting index of a substring
* Start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
  - Create a `num_chars` variable (value `2`) for the length of a substring
  - Start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
    * Extract a substring of length `num_chars` from `string` at `starting_index`
    * Append the extracted substring to the `result` array
    * Increment the `num_chars` varible by `1`
  - End the inner loop
  - Increment the `starting_index` variable by `1`
* End the outer loop
* Return the `result` array

### `is_palindrome?`
* Inside `is_palindrome?`, check whether the string value is equal to its reversed value. Use `String#reverse`

### `palindrome_substrings`
* Initialize a result variable to an empty array
* Create an array named `substrings_arr` that contains all the substrings of the input string that are at least two characters long using `substrings`
* Loop through the words in the `substring_arr` array
* Using `is_palindrome?`, append the word to the result array if it is a palindrome
* Return the result array

# Code
```ruby
def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
  starting_index += 1
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substring(str)
  result = []
  substrings_arr = str.substrings
  substrings_arr.each { |s| result << s if s.is_palindrome }
  result
end
```