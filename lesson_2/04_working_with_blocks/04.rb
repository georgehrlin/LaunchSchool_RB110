a = [[18, 7], [3, 12]]

my_arr = a.each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

p a.object_id
p my_arr.object_id

# Output:
# 18
# 7
# 12

# => [[18, 7], [3, 12]]

=begin
On line 1, the return value of calling the iterative method `each` on the two-
layer nested array `[[18, 7], [3, 12]]` is assigned to the local variable
`my_arr`. `my_arr` is assigned `[[18, 7], [3, 12]]`, because `each` returns its
original calling array. `each` is called with a block and `arr` as the block
parameter. `each` iterates over the elements of the calling nested array and
passes the element being iterated (a sub-array, in this case) to the block,
which is then assigned to `arr`. Line 1 creates two iterations in total.

On line 2, within the block, `each` is called on `arr` with a block and `num` as
the block parameter. This creates an inner loop. In the first iteration of the
outer loop, `arr` is assigned `[18, 7]`, so the `each` in the inner loop on line
2 passes the elements of `[18, 7]` (`18`, then `7`) to its block.

On line 3, within the block of the inner loop, there is an `if` conditional
statement. Line 4 will be executed if the integer number `num` references is
larger than `5`. In the iterations of the inner loop, `num` references `18`,
then `7`, which are both larger than `5` and lead to line 4 being executed. On
line 4, `num` is passed to `puts` as the argument. `puts` outputs its argument
on the console, so `18` and `7` are output in the two iterations of the inner
loop.

In the second iteration of the outer loop, `[3, 12]` is assigned to `arr` on
line 1. Following that, the two iterations of the inner loop assign `3` and `12`
to `num`. Only `12` is output on the console in the iterations of the inner loop
because `3` is smaller than `5` and thus causing the conditional statement on
line 3 to fail.

Finally, this assignment expression returns `[[18, 7], [3, 12]]` in the end.
=end