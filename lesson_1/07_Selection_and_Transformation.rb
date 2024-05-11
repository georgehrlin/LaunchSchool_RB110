=begin
Selection: Picking certain elements out of the collection depending on some criterion.
Transformation: Manipulating every element in the collection.

Selection and transformation both utilize the basics of looping: a loop, a counter,
a way to retrieve the curent value, and a wayt to exit the loop.
=end

=begin
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0
=end

=begin
loop do
  current_char = alphabet[counter]

  if current_char == 'g' # This is the *selection criteria*
    selected_chars << current_char

  counter += 1
  break if counter == alphabet.size
end

selected_chars # => "g"
=end

=begin
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << (current_element + 's')

  counter += 1
  break if counter == fruits.size
end

transformed_elements # => ["apples", "bananas", "pears"]
=end

=begin
def selected_vowels(str)
  selected_chars = ''
  counter = 0

  loop do
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

  selected_chars
end

p selected_vowels('the quick brown fox')
p selected_vowels('I wandered lonely as a cloud')
p number_of_vowels = selected_vowels('hello world').size
=end

=begin
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hsh)
  fruits = {}

  hsh.each do |item, category|
    fruits[item] = category if category == 'Fruit'
  end

  fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
=end

=begin
# Using a counter and a basic loop:

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hsh)
  fruits = {}
  items = hsh.keys
  counter = 0

  loop do
    current_item = items[counter]
    current_category = hsh[current_item]

    fruits[current_item] = current_category if current_category == 'Fruit'
    # fruits[items[counter]] = hsh[items[counter]] if hsh[items[counter]] == 'Fruit'
    counter += 1
    break if counter == items.size
  end

  fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
=end

=begin
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers)
=end

=begin
def double_numbers!(numbers)
  counter = 0

  p(loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end)
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers)
p my_numbers
=end

=begin
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    p current_number
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers)
p my_numbers
=end

=begin
def double_odd_index_n(numbers)
  doubled_numbers = []
  index = 0

  loop do
    break if index == numbers.size
    if index.odd?
      doubled_numbers << (numbers[index] * 2)
    else
      doubled_numbers << (numbers[index])
    end
    index += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_index_n(my_numbers)
=end

=begin
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select(produce, 'Fruit')
p general_select(produce, 'Vegetable')
p general_select(produce, 'Meat')
=end

=begin
def multiply_array(arr, factor)
  products = []
  index = 0

  loop do
    break if index == arr.size
    products << arr[index] * factor
    index += 1
  end

  products
end

my_array = [1, 7, 2, 4, 5]
p multiply_array(my_array, 3)
=end

def select_letter(str, target)
  collector = ''
  index = 0

  loop do
    break if index == str.length

    collector << target if str[index] == target
    # collector += target if str[index] == target
    index += 1
  end

  collector
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""

alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars do
  puts char
end