=begin
arr = [[1, 3], [2]]

arr[0] # => [1, 3]

arr[0][1] # => 3

arr = [[1, 3], [2]]
arr[1] = 'hi there'
arr # => [[1, 3], "hi there"]
# The `arr[1]` on line 8 is a destructive action that changed the second element
# in the `arr` array from `[2]` to `"hi there"`.
=end

=begin
arr = [[1, 3], [2]]
arr[0][1] = 5
p arr # => [[1, 5], [2]]
=end

=begin
`arr[0][1] = 5` is syntactic sugar of `arr.[](0).[]=(1, 5)`.

`arr[0][1] = 5` is equivalent to `[1, 3][1] = 5`.

The `arr[0]` part is indexed referencing with the instance method `[]`, which
returns `[1, 3]`.
The `[1] = 5` part is indexed assignment with the destructive instance method
`[]=`, which mutates the `arr` array to `[[1, 5], [2]]`.
=end

=begin
# Other Nested Structures
arr = [{ a: 'ant'}, { b: 'bear' }]

arr[0][:c] = 'cat'
p arr # => [{:a=>"ant", :c=>"cat"}, {:b=>"bear"}]
=end

=begin
arr = [['a'], ['b']], { b: 'bear', c: 'cat' }, 'cab']
arr[0]        # => ["a", ["b"]]
arr[0][1][0]  # => "b"
arr[1]        # => {:b=>"bear", :c=>"cat"}
arr[1][:b]    # => "bear"
arr[1][:b][0] # => "b"
arr[2][2]     # => "b"
=end

=begin
# Variable Reference for Nested Collections
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]
# We need to establish a mental model of how the addition of variable reference
# affects the data in our nested collections.

a[1] = 5
arr # => [[1, 5], [2]]

arr[0][1] = 8
a   # => [1, 8]
arr # => [[1, 8], [2]]
=end

# Shallow Copy
=begin
`dup` and `clone` create a shallow copy of an object: Only the object that the
method is called on is copied; if the object contains other objects, then those
objects will be shared, not copied.
=end

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr1 # => ["a", "B", "c"]
arr2 # => ["a", "B", "c"]

arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr1 # => ["cba", "def"]
arr2 # => ["cba", "def"]

# The element objects were mutated in these two examples above because the
# destructive methods were called on the objects within the arrays rather than
# the arrays themselves. Those objects are shared.

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! { |char| char.upcase }

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
# `map!` modifies the array, replacing each element of `arr2` with a new value
# that the block returns.

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each { |char| char.upcase! }

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
# `each` is called on individual element objects of the `arr2` array, which are
# shared with `arr1`.

# Be careful: What level are you working at, the outer level of the array or
# hash, or the elements within?

# Freezing Objects
# The main difference between `dup` and `clone` is `clone` preserves the frozen
# state of the object.

=begin
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d" # => Frozen: can't modify frozen Array

arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
p arr2 << "d" # => ["a", "b", "c", "d"]
=end

# With `freeze`, Ruby objects can be frozen in order to preven them from being
# mutated. Reasonably, only mutable objects can be frozen. (Immutable objects
# are already frozen.)

# `frozen?` can be used to check whether an object is frozen.

arr = [[1], [2], [3]].freeze
arr[2] << 4
p arr # => [[1], [2], [3, 4]]
# arr[4] = "hi" # => FrozenError: can't modify frozen Array
# arr[0] = "hi" # => FrozenError: can't modify frozen Array
# `freeze` only freezes the object it is called on.
# If the object it's called on contains other objects, those objects are not
# frozen.


# In Ruby, there is no built-in or easy way to create a deep copy or deep freeze
# objects within objects.