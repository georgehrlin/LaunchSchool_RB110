=begin
Create a method that takes a nonempty string as an argument and returns an
array consisting of a string and an integer. If we call the string argument s,
the string component of the returned array t, and the integer component of the
returned array k, then s, t, and k must be related to each other such that
s == t * k. The values of t and k should be the shortest possible substring and
the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase
alphabetic letters.

Examples:
p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]

The above tests should each print true.
=end

=begin
PEDAC
P
Input: A str
Output: A two-element arr
        - 1st ele: A substr that can be multiplied to create the input str
        - 2nd ele: An int that is the multiplier for the substr

E
p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]

D
Input: A str
Intermediary: A str and an int
Output: A arr of a str and an int

A
- Multiply a substr that begins from the first char of input str with an int
  that is the (len of input str / len of current substr)
  - Substr always begins from idx 0, and its len increases by 1 in each
    iteration
  - The substr len has to be a factor of (len of str)
- Check if the multiplication result str is the same as input str
  - IF yes, return an arr of this substr and the multiplier int
  - ELSE, move on to the next iteration by increasing substr len by 1

- Initialize substr_len to 1
- Initialize multiplier to str.length / substr_len
- WHILE substr_len <= str.length
  - IF str.length % substr_len is 0
    - IF (substr of idx 0, len substr_len) * multiplier == str
      - Return [susbtr, multiplier]
  - ELSE
    - substr_len + 1
    - multiplier reasigned to str.length / substr_len
=end

# Original attempt
# Time spent: 32:54
def repeated_substring(str)
  substr_len = 1
  multiplier = str.length / substr_len

  while substr_len <= str.length
    if str.length % substr_len == 0
      if str[0, substr_len] * multiplier == str
        return [str[0, substr_len], multiplier]
      end
    end
    substr_len += 1
    multiplier = str.length / substr_len
  end
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]

# Improved after LSBot review
def repeated_substring(str)
  substr_len = 1

  while substr_len <= str.length
    if str.length % substr_len == 0
      # Initializing multiplier here prevents me from forgetting to update it
      # after every iteration
      multiplier = str.length / substr_len
      if str[0, substr_len] * multiplier == str
        return [str[0, substr_len], multiplier]
      end
    end
    substr_len += 1
  end
end
