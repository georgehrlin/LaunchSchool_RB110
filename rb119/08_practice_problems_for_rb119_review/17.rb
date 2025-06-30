=begin
Create a method that takes an array of integers as an argument. The method
should determine the minimum integer value that can be appended to the array so
the sum of all the elements equal the closest prime number that is greater than
the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6.
The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array
to sum to 7.

Notes:
- The array will always contain at least 2 integers.
- All values in the array must be positive (> 0).
- There may be multiple occurrences of the various numbers in the array.

Examples:
p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4

The above tests should each print true.
=end

=begin
PEDAC
P
Input: An arr of at least two always positive ints
Output: An int that, when added to input arr, will make the arr to sum up to
        the closeset greater prime num

E
p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

D
Input: An arr of ints
Intermediary: An arr of ints
Output: An int

A
HELPER: prime?
- Initialize a range from 1 to target int, convert to arr
- Select out the ints that can fully divide target int (remainder is 0)
- Return whether the selected out arr contains only two eles

- Sum up the ints in input arr, store it to a var
- Initialize a var, result, with val 1
- UNTIL sum of input arr + result is a prime num (HELPER: prime?)
  - result += 1
- Return result
=end

=begin
# Original attempt
# Time spent: 16:13
def prime_num?(n)
  (1..n).select { |x| (n % x).zero? }.count == 2
end

def nearest_prime_sum(arr)
  sum_arr = arr.sum
  result = 1
  until prime_num?(sum_arr + result)
    result += 1
  end

  result
end
=end

# Everything below is not timed
# Attempt after searching for the existence of a built-in prime?
# Turned out it is in the prime module
require 'prime'

def nearest_prime_sum(arr)
  sum_arr = arr.sum
  result = 1
  until (sum_arr + result).prime?
    result += 1
  end

  result
end

# A much more efficient way to construct prime_num?, suggested by LSBot
def prime_num?(n)
  (2..Math.sqrt(n)).none { |i| (n % i).zero? }
end

# Improved version after LSBot review
def nearest_prime_sum(arr)
  current_sum = arr.sum
  (1..).find { |addition| prime_num?(current_sum + addition) }
end
