=begin
Create a method that takes an array of numbers and returns the sum of each
number multiplied by its index position.

def sum_of_products(numbers)
end

# Test cases
puts sum_of_products([1, 2, 3, 4]) == 20    # (1*0) + (2*1) + (3*2) + (4*3) = 0 + 2 + 6 + 12 = 20
puts sum_of_products([5, 3, 2]) == 7        # (5*0) + (3*1) + (2*2) = 0 + 3 + 4 = 7
puts sum_of_products([]) == 0               # Empty array
=end

def sum_of_products(arr)
  arr.each_with_index.reduce(0) do |sum, (n, i)|
    sum + n * i
  end
end

puts sum_of_products([1, 2, 3, 4]) == 20    # (1*0) + (2*1) + (3*2) + (4*3) = 0 + 2 + 6 + 12 = 20
puts sum_of_products([5, 3, 2]) == 7        # (5*0) + (3*1) + (2*2) = 0 + 3 + 4 = 7
puts sum_of_products([]) == 0               # Empty array
