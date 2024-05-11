=begin
# Enumerable#any?
p [1, 2, 3].any? { |n| n > 2}

# Enumerable#all?
p [1, 2, 3].all? { |n| n > 2}
p ({ a: "ant", b: "bear", c: "cat" }.all? { |k, v| v.length >= 3 })

# Enumerable#each_with_index
p [1, 2, 3].each_with_index do |num, index|
  puts "The inidex of #{num} is #{index}."
end

p ([1, 2, 3].each_with_index do |num, index|
  puts "The inidex of #{num} is #{index}."
end)

p [1, 2, 3].each_with_index

# p [1, 2, 3].each_with_index { |num, index| puts "The inidex of #{num} is #{index}." }

{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

# Enumerable#each_with_object
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << piar.last
end
# => ["ant", "bear", "cat"]

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }
=end

# Enumerable#first
[1, 2, 3].first
# => 1

p [1, 2, 3, 4, 5].first(3)

p ({ a: "ant", b: "bear", c: "cat" }.first(2))
# Calling `first` on a hash doesn't quite make sense because hashes are generally
# thought of as unordered, but it works in Ruby

# Enumerable#include?
p [1, 2, 3].include?(2) # => true

p ({ a: "ant", b: "bear", c: "cat" }.include?("ant"))
p ({ a: "ant", b: "bear", c: "cat" }.include?(:a))
# When `include?` is called on a hash, it returns `true` only if a key that mathces
# the argument exists, not for a value.
# Because of that, `Hash#include?` is an alias for `Hash#key?` or `Hash#has_key?`

# Enumerable#partition
[1, 2, 3].partition do |num|
  num.odd?
end
# => [[1, 3], [2]]

odd, even = [1, 2, 3].partition { |num| num.odd? }
p odd
p even

long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
p long
p short

=begin
List:
Enumerable#any?
Enumerable#all?
Enumerable#each_with_index
Enumerable#each_with_object
Enumerable#first
Enumerable#include?
Enumerable#partition