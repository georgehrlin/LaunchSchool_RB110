# Bouncy Numbers
Some numbers have only ascending digits, like 123, 3445, 2489, etc.
Some numbers have only descending digits, like 321, 5443, 9842, etc.
A number is "bouncy" if it has both ascending and descending digits, like 313, 92543, etc.
Write a method that takes a list of numbers and counts how many of them are bouncy.

```ruby
p bouncyCount([]) == 0
p bouncyCount([11, 0, 345, 21]) == 0
p bouncyCount([121, 414]) == 2
p bouncyCount([176, 442, 80701644]) == 2
```

## Understand the Problem
Input: An array of numbers
Output: An integer number that indicates how many of the numbers in the input array are bouncy

Rules
- Explicit:
    * Numbers that contain only ascending digits or only descending digits are not bouncy (i.e., 123, 321)
    * Numbers that contain both ascending and descending digits are bouncy (i.e, 313, 80701644)
- Implicit:
    * If input is an empty array, output is 0
    * Digits that remain the same do not indicate or change "direction" (i.e., 45556 is ascending; 45554 is bouncy)
    * Numbers have to have at least three digits to be evaluated for bounciness

## Examples
```
p bouncyCount([]) == 0
p bouncyCount([11, 0, 345, 21]) == 0
p bouncyCount([121, 414]) == 2
p bouncyCount([176, 442, 80701644]) == 2
p bouncyCount([45556, 45554]) == 1
```

## Data Structures
- Input is an array of integer numbers
- Output is an integer

## Algorithm
### `bouncyCount`
1. Initialize a tracker variable (initially `0`) that tracks the number of bouncy numbers in input array
2. Iterate through every integer element of the input array
   - Check if the integer element is bouncy **(extracted as a sub-problem)**
   - If it is bouncy, increment the tracker by `1`
3. Return tracker

## Sub-Problem
### `bouncy?`
Input: An integer number
Output: A boolean value that indicates whether input number is bouncy or not

Examples:
```
bouncy?(1221) == true
bouncy?(2112) == true
bouncy?(121) == true
bouncy?(212) == true
bouncy?(1121) == true
bouncy?(2212) == true

bouncy?(111) == false
bouncy?(12) == false
bouncy?(21) == false
bouncy?(123) == false
bouncy?(321) == false
bouncy?(1111) == false
bouncy?(1223) == false
bouncy?(3221) == false
bouncy?(0) == false
bouncy?() == false
```

Check whether input number has at least three digits
  - If not, immediately return false

Create an initial direction variable that keeps track of the direction of the first two digits

Create a current direction variable that keeps track of the direction of the current two digits being evaluated


Iterate through all the digits
- Compare the first digit and the second digit
  * If first > second
    - Set initial direction to down
  * If first < second
    - Set initial direction to up
  * If first = second
    - Set initial direction to neutral

- Compare the second digit and the third digit
  * If second > third
    - Check if initial direction is neutral
      * If initial direction is neutral, set initial direction to down
      * If inital direction is not neutral, set current direction to down
  * If third > second
    - Check if initial direction is neutral
      * If initial direction is neutral, set initial direction to up
      * If inital direction is not neutral, set current direction to up
  * If second = third
    - Check if initial direction is neutral
      * If initial direction is neutral, set initial direction to neutral
      * If inital direction is not neutral, set current direction to down

- Compare initial direction with current direction
  * If inital direction and current direction are different
    - Immediately return true
  * Otherwise, continue the iteration of comparison with the next two digits















Check whether input number has at least three digits
  - If not, immediately return false

Create a variable initial direction and set it to `nil`
Create a variable current direction and set it to `nil`


Iterate through all the digits of the input number

Compare first digit and second digits
  - If first > second, set initial direction to down
  - If first < second, set initial direction to up
  - Otherwise, do nothing

Compare second and third digits
  - First check if inital diretion is `nil`?
    * If not, compare second and third digit, deduce their direction, and compare their direction to initial direction
      - If initial direction and current direction are different, immediately return true
      - If second and third digits are the same, do nothing and move on
    * If yes, compare second and third digit, deduce their direction, and set their direction to initial direction