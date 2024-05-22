p ([ { a: 'ant', b: 'elephant' }, { c: 'cat' } ].select do |hash|
  hash.any? do |key, value|
  #hash.all? do |key, value|
    value[0] == key.to_s
  end
end)

# => [{:c=>"cat"}]

=begin
On line 1, the iterative method `select` is called on the array that consists of
two hashes as elements, with a block and `hash` as the block parameter. In every
iteration, one of the element hashes is passed to the block and assigned to
`hash`. `select` returns a new array the elements of which are evluated to be
true by the block.

In the first iteration, `hash` references `{ a: 'ant', b: 'elephant' }`. Inside
the outer block, on line 2, the iterative method `all?` is called on `hash` with
a block, as well as `key` and `value` as the block parameters. `all?` returns
true if all of the elements of the calling collection are evaluated to be true
by the block.

In the inner block, on line 3, indexed referencing is called on `value` with `0`
as the argument, so `a` is returned in the first iteration, and `e` is returned
in the second. The method `to_s` is called on `key`, which returns `"a"` in the
first iteration, and `"b"` in the second. Lastly, the `==` operator is called
with `value[0]` and `key.to_s` as the operands. `==` returns `true` if the two
operands are equivalent and `false` if otherwise. Line 3 thus returns `true` in
the first iteration, and `false` in the second.

Therefore, not all of the elements are evaluated to be true by the block; 
`hash.all?` thus returns `false`, and nothing is appended to the new array that
`select` on line 1 will return as a result.

By the same process, in the second iteration of the outer block, `hash`
references `{ c: 'cat' }`. The `all?` method call on line 2 then returns `true`
because `value[0]` returns `"c"`, which is equivalent to `key.to_s`'s return
value, `"c"`. As a result, `{ c: 'cat' }` is included in the new array that
`select` will return.

Finally, `select` returns a new array of `[{:c=>"cat"}]`.
=end

=begin
What would happen if, instead of using `all?`, we used `any?`.
Why would this affect the return value of select?

The outer block would evaluate to true in both of its iterations if we had
`any?` on line 2 instead of `all?`. Therefore, the code would return 
`[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]``.
=end