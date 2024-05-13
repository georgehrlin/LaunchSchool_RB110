numbers = [1, 2, 3, 4]

numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
I am not entirely certain about what goes on with the iterations, especially
after the first.

In the first iteration of the code above, line 4 outputs `1` on the console,
then line 5 removes the first element of the calling array and returns it.
The second iteration is when things become uncertain. `numbers` should reference
`[2, 3, 4]` because `1` was removed from the last iteration. Does the second
iteration passes `2` (which is now the first element of the array) to `number`,
or `3`?

My guess is that in the second iteration, `number` still points to `2`, despite
it being the first element of the `numbers`` array. I'd wager that the order of
assignment to `number` is decided when `each` is called on `numbers`, so 
mutating the `numbers` array later during the interations does not affect what
is assigned to `number`.

Therefore, I think the code above outputs on the console:
1
2
3
4
And `numbers` references `[]` after the execution.
=end

p numbers # => [3, 4]
# Output:
# 1
# 3

=begin
Based on the output and the return value of `p numbers`, I must correct my
initial assumptions of how this code operates.

In the first iteration, `1` is assigned to `number`. Therefore, line 4 outputs
`1` on the console. Line 5 then removes `1` from the calling array. The `numbers`
array is now `[2, 3, 4]`

In the second iteration, `3`, the element that is now at index 1 of the `numbers`
array, is assigned to `number`. Line 4 thus outputs `3` on the console. Line 5
continues to removes the first element of the calling array, which is now `2`.
The `numbers` array is now `[3, 4]`.

There is not a third iteration, because `each` would be iterating the element at
index 2, but there is none. The `numbers` array is now `[3, 4]`.
=end

numbers = [1, 2, 3, 4]

numbers.each do |number|
  p number
  numbers.pop(1)
end

p numbers

=begin
This code outputs on the console:
1
2

`numbers` references `[1, 2]` in the end.
=end

# Iterators do not work on a copy of the original array or from stale meta-data
# about the array. The operate on the original array in real time.