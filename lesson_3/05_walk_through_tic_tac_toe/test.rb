=begin
def greet(name1, name2)
  puts "Hello, #{name1} and #{name2}!"
end

names = ["Alice", "Bob"]
greet(*names)
=end

=begin
arr = ['a', 'b']
p(*arr)

puts ['a', 'b']
p arr

arr1 = [1, 2, 3]
arr2 = [0, *arr1, 4] # => [0, 1, 2, 3, 4]

def sum(*nums)
  nums.sum
end

sum(1, 2, 3, 4) # => 10
=end

first, *rest = [1, 2, 3, 4, 5]
p first
p rest