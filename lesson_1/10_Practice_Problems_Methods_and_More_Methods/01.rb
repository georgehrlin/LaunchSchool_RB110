[1, 2, 3].select do |num|
  num > 5
  'hi'
end

=begin
The return value of this `select` method call is `[1, 2, 3]`.

This is because `select` returns an array with selected elements based on the
return value of the block. In an iteration, if the block returns a truthy value,
the element being iterated is added to the final array to be returned.

In this code, the return value of the block is `'hi'` (since it is the last line
of expression). `'hi'` is truthy, so for every itertion of the `select` method
call the block returns a truthy value. Therefore, every element of the calling
array is added to the final array.
=end