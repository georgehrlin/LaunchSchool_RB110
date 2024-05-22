[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Output:
# 1
# 3

# => [1, 3]

=begin
On line 1, the iterative method `map` is called on the two-layer nested array
`[[1, 2], [3, 4]]` with a block and `arr` as the block parameter. In each
iteration, an element of the calling array (a sub-array, in this case) is passed
to the block and assigned to `arr`. There are two iterations in total.

In the first iteration, `arr` references `[1, 2]`. On line 2, `first` is called
on `arr`. `first` returns the element at index 0 of the calling array, so
`arr.first` returns `1`. `1` is then passed to `puts` as the argument. `puts`
outputs the string representation of its argument on the console, so `1` is
output on the console. On line 3, `first` is called again on `arr` which returns
`1`. `1` is implicitly returned as the return value of the block because line 3
is the last line within the block.

In the second iteration, `arr` references `[3, 4]`. Line 2 outputs `3` on the
console. Line 3 returns `3`, which is implicitly returned as the return value of
the block.

Finally, `map` returns an array consists of the return values of its block, so
the method invocation of `map` on line 1 returns `[1, 3]`.
=end