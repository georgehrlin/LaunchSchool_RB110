=begin
PERCENTAGE OF EVENS
From 20240508 study session

Given a positive integer, return the percentage of even numbers between 1 and
that integer, rounded to two decimal places.

p evenPercent(1) == 0
p evenPercent(2) == 0.5
p evenPercent(3) == 0.33
p evenPercent(12) == 0.5
p evenPercent(13) == 0.46
=end

=begin
PEDAC
P
Input: An int
Output: A two-decimal flt that is the precentage of even numbers out of all the
        numbers between 1 and input int, inclusvie

E
p evenPercent(1) == 0
p evenPercent(2) == 0.5
p evenPercent(3) == 0.33
p evenPercent(12) == 0.5
p evenPercent(13) == 0.46

D
Input: An int
Intermediary: A range potentially
Output: A flt

A
- Generate a collection of nums from 1 to input int
- Count the num of even nums in this collection
- Divide num of even nums by num of the collection
=end

def evenPercent(input)
  ((1..input).count { |n| n.even? }).fdiv(input).round(2)
end

p evenPercent(1) == 0
p evenPercent(2) == 0.5
p evenPercent(3) == 0.33
p evenPercent(12) == 0.5
p evenPercent(13) == 0.46
