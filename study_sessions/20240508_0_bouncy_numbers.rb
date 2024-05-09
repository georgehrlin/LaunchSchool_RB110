# BOUNCY NUMBERS
=begin
Some numbers have only ascending digits, like 123, 3445, 2489, etc.
Some numbers have only descending digits, like 321, 5443, 9842, etc.
A number is "bouncy" if it has both ascending and descending digits, like 313, 92543, etc.
Write a method that takes a list of numbers and counts how many of them are bouncy.

p bouncyCount([]) == 0;
p bouncyCount([11, 0, 345, 21]) == 0;
p bouncyCount([121, 414]) == 2;
p bouncyCount([176, 442, 80701644]) == 2;


Algorithm for `bouncyCount`
- Create `counter` that references `0`
- Iterate over every element in the array
  - Check if the element is bouncy (with helper method `bouncy?`)
  
- Return `counter`

`bouncy?`
Input: An integer number
Output: A boolean value of whether the input is bouncy

Rules:
- Input integer has to have at least three digits
- Input is bouncy if:
  * Numbers increase then decrease (or vice versa), with or without remaining stagnant in the interim
- Input is not bouncy if:
  * Numbers only increase or decrease, with or without remaining stagnant in the interim

Algorithm:
- 


p bouncy[0] == false
p bouncy[11] == false
p bouncy[446] == false
p bouncy[121] == true
p bouncy[4553] == true

From Joshua Hall

def bouncy?(int)
  up = false
  down = false
  working = int.to_s.chars
  length = working.count
  counter = 1
  until counter == length do
    if working[counter].to_i > working[counter-1].to_i
      up = true
    elsif working[counter].to_i < working[counter-1].to_i
      down = true
    end
    counter += 1
  end
  up && down
end

def bouncyCount(arr)
  count = 0
  arr.each do |number|
    count += 1 if bouncy?(number)
  end
  count
end