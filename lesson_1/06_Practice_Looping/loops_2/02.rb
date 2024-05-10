loop do
  number = rand(100)
  puts number
  break if (0 <= number && number <= 10)
  # Official solution: break if number.between(0, 10)
end