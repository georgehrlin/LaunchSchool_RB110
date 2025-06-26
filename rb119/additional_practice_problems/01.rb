=begin
BOUNCY NUMBERS
From 20240508 study session

Some numbers have only ascending digits, like 123, 3445, 2489, etc.
Some numbers have only descending digits, like 321, 5443, 9842, etc.
A number is "bouncy" if it has both ascending and descending digits, like 313,
92543, etc.

Write a method that takes a list of numbers and counts how many of them are
bouncy.

p bouncyCount([]) == 0;
p bouncyCount([11, 0, 345, 21]) == 0;
p bouncyCount([121, 414]) == 2;
p bouncyCount([176, 442, 80701644]) == 2;
=end

=begin
PEDAC
P
Input: An arr of ints
Output: An int of the number of "bouncy" numbers in int arr
        - A "bouncy" number contains at least a pair of ascending digits and a
          pair of descending digits
        - Returns 0 if no "bouncy" number is found

E
p bouncyCount([]) == 0;
p bouncyCount([11, 0, 345, 21]) == 0;
p bouncyCount([121, 414]) == 2;
p bouncyCount([176, 442, 80701644]) == 2;

D
Input: An arr of ints
Intermediary: An arr of single-digit ints or strs potentially
Output: An int

A
- HELPER: bouncy?(int)
  - Initialize a flag, pair_ascending, with val false
  - Initialize a flag, pair_descending, with val false
  - Create an arr of digits of int with #digits and #reverse
  - Iterate over idxs from 0 to len of arr - 1 (non-inclusive)
    - IF current digit < digit at (current idx + 1)
      - Set pair_ascending to true
    - ELSIF current digit > digit at (current idx + 1)
      - Set pair_descending to true
    - Return true immediately if pair_ascending and pair_descending are true
  - Return false

- Iterate over input arr using #count
  - Check if current int is bouncy? (HELPER)
=end

def bouncy?(int)
  pair_ascending = false
  pair_descending = false

  digits = int.digits.reverse
  (0...(digits.length - 1)).each do |i|
    if digits[i] < digits[i + 1]
      pair_ascending = true
    elsif digits[i] > digits[i + 1]
      pair_descending = true
    end
    return true if pair_ascending == true && pair_descending == true
  end

  false
end

def bouncyCount(ints)
  ints.count { |int| bouncy?(int) }
end

p bouncyCount([]) == 0
p bouncyCount([11, 0, 345, 21]) == 0
p bouncyCount([121, 414]) == 2
p bouncyCount([176, 442, 80701644]) == 2
