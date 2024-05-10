numbers = [7, 9, 13, 25, 18]

until numbers == []
  puts numbers.shift
end

puts "\nUsing indexed referencing instead:"

numbers = [7, 9, 13, 25, 18]

i = 0

until i == numbers.size
  puts numbers[i]
  i += 1
end