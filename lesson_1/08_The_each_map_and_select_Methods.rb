numbers = [1, 2, 3]
counter = 0

=begin
loop do
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end
=end

# numbers.each { |n| puts n }

=begin
For each iteration, `each` sends the value of the current element to the block
in the form of an argument. The block parameter is `n` and it represents the
value fo the current element in the array.
=end

hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end
# `each` returns the original collection after invocation
# `loop` returns `nil`

p [1, 2, 3].map { |n| n * 2 }