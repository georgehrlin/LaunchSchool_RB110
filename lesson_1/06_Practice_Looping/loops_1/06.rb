numbers = []

while numbers.size < 5
  numbers << rand(0..99) # I could just do rand(100)
end

puts numbers