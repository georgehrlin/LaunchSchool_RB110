p ({ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end)

=begin
I could be wrong, but I think this code returns: `[nil, 'bear']`.

On line 1, the iterative method `map` is called on an array object with a block
and two block parameters, `key` and `value`. `map` returns an array consists of
return values of the block.

In the first iteration, the `if` condition on line 2 evaluates to `false` so the
block returns `nil`, which is then appended to the array that will be returned
by `map`. In the second iteration, line 2 evaluates to `true`, so `value`, which
references `'bear'`, will be appended to the final array. That's the end of the
iteration.

Therefore, `map` will return `[nil, 'bear']`.
=end

# `map` always returns an array