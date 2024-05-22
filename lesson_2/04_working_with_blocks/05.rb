[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => [[2, 4], [6, 8]]

=begin
On line 1, the iterative method `map` is called on the two-dimensional array
`[[1, 2], [3, 4]]` with a block and `arr` as the block parameter. `map` returns
a new array consists of the return values of the block.

Inside the block, on line 2, `map` is called again on the sub-array that `arr`
represents with a block and `num` as the block parameter. Inside the inner block,
the operator `*` is used with operands `num` and `2`, which will return the
result of the integer referenced by `num` multiplied by `2`.

In the first iteration of the outer loop, `[1, 2]` is passed to the outer block,
which leads to the element integers `1` and `2` being passed to the inner block.
The return values of the inner block is therefore `2` and `4`, which lead to the
inner `map` returning `[2, 4]`. `[2, 4]` is appended to the final array that the
outer `map` will return in the end.

In the second iteration of the outer loop, `[3, 4]` is passed to the outer block,
which leads to the element integers `3` and `4` being passed to the inner block.
The inner `map` returns `[6, 8]`, and it is appended to the final array that the
outer `map` will return in the end.

Finally, the outer `map` returns `[[2, 4], [6, 8]]`.
=end