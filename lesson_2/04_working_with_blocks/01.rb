[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

# Output:
# 1
# 3

# => [[1, 2], [3, 4]]

=begin
The iterative method `each` is called on the two-layer nested array
`[[1, 2], [3, 4]]` with a block and `arr` as the block parameter.

In each iteration, an element of the calling array (one of the sub-arrays) is
passed to the block as an argument and then assigned to `arr`.

There are two iterations in total. In the first iteration, `arr` references
`[1, 2]`. Then, the method `puts` is called with the return value of calling the
method `first` on `arr` as the argument. `first` returns the first element of
its calling array, so calling `first` on `arr` returns the first element that
`arr` references. `arr.first` returns `1`. `puts` converts its argument to a
string and outputs it on the console, so `1` is output on the console.

`puts` returns `nil`, so `nil` is implicitly returned as the return value of
the block since line 2 is the only line of the block. `each` does not accept
return values of the block.

In the second iteration, `arr` references `[3, 4]`, so `3` is output on the
console.

`each` returns its calling array. Therefore, this code returns
`[[1, 2], [3, 4]]`.
=end

=begin
Always ask:
- What is the type of action being performed (method call, block, conditional,
  etc.)?
- What is the object that the action is being performed on?
- What is the side effect of that action (e.g., output or mutation)?
- What is the return value of that action?
- Is the return value used by whatever that instigaed the action?
=end