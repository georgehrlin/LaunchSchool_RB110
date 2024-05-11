['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

=begin
The return value is `{"a"=>"ant", "b"=>"bear", "c"=>"cat"}`.

The method `each_with_object` is called on the array object `['ant', 'bear', 'cat]`,
with an empty hash as the argument, and a block with two block parameters
(`value` and `hash`). `each_with_object` iterates through the calling array and
passes each element string to the block. The element string is assigned to
`value`. The argument, the empty hash, is assigned to `hash`.

Inside the block, in every iteration, a key-value pair is assigned to `hash`
with the character at index 0 of the element string being iterated as the key,
and the element string itself as the value.

Finally, `each_with_object` returns the object that is passed to it as the
argument. Therefore, the method call returns `{"a"=>"ant", "b"=>"bear", "c"=>"cat"}`.
=end

=begin
With `each_with_object`, the argument of the method call becomes available
inside the block such that it can be mutated.
=end