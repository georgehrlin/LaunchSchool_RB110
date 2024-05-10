numbers = []

loop do
  puts 'Enter any number:'
  numbers << gets.chomp.to_i
  break if numbers.size == 5
end

puts numbers