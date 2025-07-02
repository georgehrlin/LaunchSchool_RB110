=begin
Write a method that takes an array of numbers and returns a new array where
each element represents the maximum value seen so far (including the current
element).

def running_maximum(numbers)
end

# Test cases
puts running_maximum([1, 3, 2, 5, 4]) == [1, 3, 3, 5, 5]
puts running_maximum([5, 4, 3, 2, 1]) == [5, 5, 5, 5, 5]
puts running_maximum([1]) == [1]
=end

require 'pry'

def running_maximum(arr)
  arr.each_index.reduce([]) do |result, i|
    result << arr[..i].max
  end
end

puts running_maximum([1, 3, 2, 5, 4]) == [1, 3, 3, 5, 5]
puts running_maximum([5, 4, 3, 2, 1]) == [5, 5, 5, 5, 5]
puts running_maximum([1]) == [1]
