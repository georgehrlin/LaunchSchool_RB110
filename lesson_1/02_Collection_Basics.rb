=begin
str = 'abcdefghi'

p str[2]
p str[3, 3] # => "def"
# This is actually: str.slice(2, 3)

p str[3, 3][0] # => "d"
=end

=begin
arr = ['a', 'b', 'c', 'd', 'e']

p arr[2]       # => "c"
p arr[2, 3]    # => ["c", "d", "e"] # My answer
# This is syntatic sugar for: arr.slice(2, 3)
p arr[2, 3][0] # => "c"
=end

=begin
arr = [1, 'two', :three, '4']
arr.slice(3, 1) # => ["4"]
arr.slice(3..3) # => ["4"]
arr.slice(3)    # => "4"
=end

=begin
hsh = { 'fruit' => 'apple', 'vegeatable' => 'carrot' }
p hsh.object_id

p hsh['fruit']    # => "apple"
p hsh['fruit'][0] # => "a"

hsh = { 'apple' => 'fruit', 'carrot' => 'vegeatable', 'pear' => 'fruit' }
p hsh.object_id

country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
p country_capitals.keys      # => [:uk, :france, :germany] # My answer
p country_capitals.values    # => ["London", "Paris", "Berlin"] # My answer
p country_capitals.values[0] # => "London" # My answer
=end

=begin
str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

p str[2] # => "c"
p arr[2] # => "c"

p str[5] # => nil
p arr[5] # => nil
# Using indexed referencing with an out-of-bounds index returns nil

p arr.fetch(2) # => "c"
p arr.fetch(5) # => IndexError
# Array#fetch is a good replacement for Array#[] because it raises an exception
# when the index provided is out-of-bounds

p str[-2] # => "d"
p arr[-2] # => "d"
=end

=begin
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

p str[-6] # => (It's gotta be an error, right? nil is possible.)
# OK. It's nil
p arr[-6] # => (It's gotta be an error, right? nil is possible.)
# OK. It's nil
p arr.fetch(-6) # IndexError
=end

=begin
hsh = { :a => 1, 'b' => 'two', :c => nil, nil => 'xD' }

p hsh['b'] # => "two"
p hsh[:c]  # => nil
p hsh['c'] # => nil
p hsh[:d]  # => nil

p hsh.fetch('b') # => "two"
p hsh.fetch(:c)  # => nil
# p hsh.fetch('c') # => KeyError (?) # My answer
# p hsh.fetch(:d)  # => KeyError (?) # My answer

p hsh.fetch(nil)
=end

=begin
str = 'Practice'
p arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
p arr.join        # => "Practice"
=end

=begin
str = 'How do you get to Carnegie Hall?'
arr = str.split
p arr           # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
p arr.join      # => "HowdoyougettoCarnegieHall?"
p arr.join(' ') # => "How do you get to Carnegie Hall?"

result_1 = ""
arr.each { |word| result_1 += (word + ' ') }
p result_1.strip
p result_1.rstrip

result_2 = arr[0] + ' ' + arr[1] + ' ' + arr[2] + ' ' + arr[3] + ' ' + arr[4] +
           ' ' + arr[5] + ' ' + arr[6]
p result_2
=end

=begin
hsh = { sky: "blue", grass: "green" }

p hsh.to_a

arr = [[:name, 'Joe'], [:age, 10], [:favourite_color, 'blue']]

p arr.to_h
=end

=begin
str = "joe's favourite color is blue"
str[0] = 'J'
p str # => "Joe's favourite color is blue"
p str.split.each { |word| word.capitalize! }.join(' ') # My answer

p str
str[6]  = 'F'
str[16] = 'C'
str[22] = 'I'
str[25] = 'B'

p str
=end

=begin
str = 'pothos'
str[0] = 'P'
p str
=end

=begin
arr = [1, 2, 3, 4, 5]
# arr[0] += 1
# This is syntactic sugar for: arr[0] = arr[0] + 1
# Which is syntactic sugar for: arr.[]=(0, (arr.[](0).+(1)))
arr.[]=(0, (arr.[](0).+(1)))
p arr # => [2, 2, 3, 4, 5]

arr.each_index { |i| arr[i] += 1 if i != 0}
p arr
=end

hsh = { apple: 'Produce',
        carrot: 'Produce',
        pear: 'Produce',
        broccoli: 'Produce' }

hsh[:apple] = 'Fruit'

p hsh

hsh[:carrot]   = 'Vegeatable'
hsh[:pear]     = 'Fruit'
hsh[:broccoli] = 'Vegeatable'

p hsh