number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  next if (number_a < 5 && number_b < 5)

  if (number_a == 5 || number_b == 5)
    puts '5 was reached!'
    break
  end
end

# Imporved Code After Reading Official Solution

loop do
  number_a += rand(2)
  number_b += rand(2)

  next if (number_a < 5 && number_b < 5)

  puts '5 was reached!'
  break
end

# Further Exploration
# Using `next` is pretty good for this example, even though it is not as easy
# to read as using an `if/else` statement.