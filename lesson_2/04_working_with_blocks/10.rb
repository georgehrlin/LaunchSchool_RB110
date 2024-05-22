[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el
      el += 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end

# => [[[2, 3], [4, 5]], [6], [7]]]

=begin
On line 1, the iterative `map` is called on a three-dimensional array 
`[[[1, 2], [3, 4]], [5, 6]]` with a block and `arr` as the block parameter.
`map` returns a new array consists of return values of the block.
`[[1, 2], [3, 4]]`, and then `[5, 6]` are passed to the block and assigned to
`arr` in two seaprate iterations.

Inside the outer block, on line 2, `map` is called on `arr` with a block and `el`
as the block parameter. Within the first itration of the outer block, there are
two iterations of the inner block. `el` is first assigned `[1, 2]`, and then
`[3, 4]`.

Inside the inner block, on line 3, there is an `if` statment. If the condition
on line 3 evluates to be true, line 4 is executed, otherwise, line 6 is executed.
On line 3, `to_s` is first called on `el`, the return value of which `to_i` is
then called on. `el` references `[1, 2]` in one iteration, then `[3, 4]` in the
other, so `el.to_s.to_i` returns `0` in both iterations, and line 3 evaluates to
be false in both iterations as well, leading to line 6 being executed.

On line 6, `map` is called on `el` with a block and `n` as the block parameter.
Within the first iteration of this inner-inner block, on line 7, `n` first
references `1`, and then `2`. The only expression of this inner-inner block is
`n + 1`, so its return value is implicitly returned as the return value of the
block. The inner-inner block's return values are `2`, and then `3`; in the
second iteration of the inner-inner block, the return values are `4`, and then
`5`; they are in turn included in the new arrays returned by the `map` on line
6 on two separate iterations, hence this `map` returns `[2, 3]`, and then
`[4, 5]`.

`[2, 3]` and `[4, 5]`, which are the return values of the `map` on line 6,
bcome the return values of the inner block on line 2. They are appended to the
new array that the `map` on line 2 will return.

On line 4, `el` is reassigned the total of what `el` references plus
`1`. Therefore, `el` is reassigned `2`, and then `3`, which are returned as the
return value of the inner block.

Following the same procedure, in the next iteration of the inner block, `4` and
`5` are returned as the return value of the inner block. As a result, the inner
`map` returns `[[2, 3], [4, 5]]`, which becomes the return value of the outer
block.

Going back to the iterations of the outer `map`, in its second iteration, `arr`
is assigned `[5, 6]`, on which the inner `map` is then called. `el` thus
references `5` and then `6` in separate iterations. Inside the `if` statement on
line 3, line 3 evaluates to be false, so line 6 is executed instead. On line 6,
`map` is called on `el` with a block and `n` as the block parameter. Within this
block, on line 7, `n` first references `5`, and then `6`. The only expression of
this inner-inner block is `n + 1`, so its return value is implicitly returned as
the return value of the block. The inner-inner block's return values are `6`,
and then `7`; they are included in the new array returned by the `map` on line
6, `[6, 7]`.

The return value of the `map` on line 6 becomes the return value of the block on
line 2,
=end