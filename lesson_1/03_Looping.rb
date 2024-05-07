=begin
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr [counter] += 1
  counter += 1
  break if counter = arr.size
end

p arr # => [2, 3, 4, 5, 6]
=end

=begin
loop do
  number = rand(1..10)
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
=end

=begin
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end
=end

=begin
alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  # break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
  break if counter == alphabet.size
end
=end

=begin
objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end
=end

num_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}

p keys = num_of_pets.keys

counter = 0

loop do
  break if counter == num_of_pets.size
  puts num_of_pets[keys[counter]]
  counter += 1
end