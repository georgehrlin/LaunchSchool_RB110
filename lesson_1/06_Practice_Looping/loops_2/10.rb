def greeting
  puts 'Hello!'
end

number_of_greetings = 2

n = 0

while n < 2
  greeting
  n += 1
end

# Official Answer
while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end