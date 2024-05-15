=begin
Other than selection and transformation, another common way of working with
collections is to sort them into some kind of order. Sorting is mostly
performed on arrays.

What is Sorting?
Sorting is setting the order of the items in a collection according to a certain
criterion.
=end

=begin
[2, 5, 3, 4, 1]
[1, 2, 3, 4, 5]

p [2, 5, 3, 4, 1].sort # => [1, 2, 3, 4, 5]
=end

=begin
Comparison
Sorting is essentially carried out by comparing the items in a collection with
each other, and ordering them based on the result of that comparison. Comparison
is at the heart of how sorting works.

`sort` uses `<=>` (the spaceship operator) to determine how to order the
elements in an array.
=end

['c', 'a', 'e', 'b', 'd'].sort # => ['a', 'b', 'c', 'd', 'e']

=begin
`<=>`
Any object in a collection to be sorted must implement a `<=>` method. This
method performs comparison between two objects of the same type and returns `-1`,
`0`, or `1` if the first object is less than, equal to, or larger than the
second object. If the two objects cannot be compared, `nil` is returned.

The return value of `<=>` is used by `sort` to determine the order in which to
place the items. If `<=>` returns `nil` to `sort` then it throws an argument
error.

`sort` does not care about how `<=>` compares items, all it cares about is the
return value of `<=>` (it's looking for `-1`, `0`, `1`, or `nil`).

When using `sort`, it is important to know how `<=>` performs comparison for the
type of object that you want to sort (check the docs).
=end

=begin
p 2 <=> 1 # => 1
p 1 <=> 2 # => -1
p 2 <=> 2 # => 0
p 'b' <=> 'a' # => 1
p 'a' <=> 'b' # => -1
p 'b' <=> 'b' # => 0
1 <=> 'a' # => nil

['a', 1].sort # ArgumentError
=end

=begin
The ASCII table determines the ASCII character order for string comparisons.

General rules to remember:
- Uppercase letters come before lowercase letters
- Digits and (most) punctuation come beore letters
- There is an extended ASCII table that contains accented and other characters
  and it comes after the main ASCII table
=end

=begin
p 'A' <=> 'a' # => -1
p 'a' <=> 'A' # => 1
p '1' <=> 'a' # => -1
p '1' <=> 'A' # => -1
p '999' <=> 'A' # => -1

# `ord` returns the ASCII position of a character
p 'b'.ord
p 'B'.ord
p '1'.ord
p '9'.ord
p '99'.ord
p '999'.ord
=end

=begin
Calling `sort` with a Block
Invoking `sort` with a block allows us more control over how the items are
sorted. The block needs two arguments passed to it, which are the two items to
be compared, and the return value of the block has to be `-1`, `0`, `1`, or
`nil`.
=end

=begin
p [2, 5, 3, 4, 1].sort { |a, b| a <=> b } # => [1, 2, 3, 4, 5]
p [2, 5, 3, 4, 1].sort { |a, b| b <=> a } # => [5, 4, 3, 2, 1]

p [2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
# Output: a is 2 and b is 5
# Output: a is 5 and b is 3
# Output: a is 2 and b is 3
# Output: a is 5 and b is 4
# Output: a is 3 and b is 4
# Output: a is 5 and b is 1
# Output: a is 4 and b is 1
# Output: a is 3 and b is 1
# Output: a is 2 and b is 1
# => [1, 2, 3, 4, 5]
=end

=begin
p ['arc', 'bat', 'cape', 'ants', 'cap'].sort
# => ['ants', 'arc', 'bat', 'cap', 'cape']
# `String#<=>` compares multi-character strings character by character.
# Most characters being the same, longer strings are considered greater.

a = %w(a b c d e)
a_s = a.shuffle
p a_s
p a_s.sort { |a, b| 0 }
=end

p [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => [['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]
=begin
Each object in each sub-array is compared element-by-element, so the first
objects in all of the arrays are compared initially.

The `2` in `['b', 2]` did not cause an error because the order was established
without having it involved in the process. All the other arrays have `a` as the
first element so the position of `['b', 2]` was decided without the need for `2`.

The `3` in `['a', 'car', 'd', 3]` did not cause an error for a similar, though
slightly different reason. `3` was technically involved in the process to decide
the order but its value did not matter. `['a', 'car', 'd', 3]` is longer than
`['a', 'cat', 'b', 'c']`, so it is greater.
=end

=begin
`Enumerabl#sort_by`
`sort_by` is similar to `srot` but it is usually called with a block. The block
decides the sorting rules.

`sort_by` is more general-purpose than `sort` and can be called by collection
classes like arrays, hashes, sets, and more.

The array class defines a `sort_by!` that is unavailable to other collections.
=end
['cot', 'bed', 'mat'].sort_by { |word| word[1] }
# => ['mat', 'bed', 'cot'']

=begin
Calling `sort_by` on Hashes
When calling `sort_by` on a hash, two arguments (the key and value) are needed
to be passed to the block.

`sort_by` always returns an array.
=end

people = { Kate: 27, john: 25, Mike: 18 }

people.sort_by { |_, age| age } # => [[:Mike, 18], [:john, 25], [:Kate, 27]]

people.sort_by { |name, _| name.capitalize } # => [[:john, 25], [:Kate, 27], [:Mike, 18]]

# `sort!` and `sort_by!` are exclusive to arrays.

=begin
Other Methods That Use Comparison
`min`
`max`
`minmax`
`min_by`
`max_by`
`minmax_by`

Likewise, make sure the objects on which these methods are called have `<=>`
implemented.
=end