[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end

# Output:
# 1
# 3

# => [nil, nil]

=begin
The iterative method `map` is called on the two-layer array `[[1, 2], [3, 4]]`
with a block and `arr` as the block parameter.

In each iteration, an element of the calling array (one of the sub-arrays) is
passed to the block and assigned to `arr`. There are two iterations in total.

In the first iteration, `arr` is assigned `[1, 2]`. `first` is called on `arr`
and the return value is then passed to `puts` as the argument. The method
`first` returns the first element of its calling array. Therefore, `arr.first`
returns `1`, which is then passed to `puts`. `puts` outputs the string
representation of its argument, so `1` is output on the console.

The block's return value is `nil` because its only line's return value is `nil`
due to `puts` being the last executed method. `map` returns a new array consists
of return values of its block. At the end of the first iteration, `nil` is
appended to the array that `map` will eventually return.

In the second iteration, `arr` is assigned `[3, 4]`, so `3` is output on the
console, and another `nil` is appended to the final array that `map` will
return.

After the two iterations conclude, `map` returns a new array, `[nil, nil]`.
=end