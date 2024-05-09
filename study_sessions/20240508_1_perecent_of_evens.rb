# PERCENTAGE OF EVENS
=begin
Given a positive integer, return the percentage of even numbers between 1 and
that integer, rounded to two decimal places.

p evenPercent(1) == 0
p evenPercent(2) == 0.5
p evenPercent(3) == 0.33
p evenPercent(12) == 0.5
p evenPercent(13) == 0.46
=end

=begin
PEDAC for `evenPercent`
Input: An integer number
Output: A float that represents the percentage of even numbers between 1 and that integer

Rules:
- The boundaries are inclusive. `evenPercent(2) == 0.5` toook both `1` and `2` into account

Algorithm:
- Generate an array 

Code:
=end

def evenPercent(n)
  evens = []
  (1..n).each { |num| (evens << num) if (num % 2 == 0) }
  ((evens.size.to_f) / n).round(2)
end