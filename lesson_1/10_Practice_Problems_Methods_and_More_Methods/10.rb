[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=begin
The return value of this code is `[1, nil, nil]`.

`map` returns an array consists of the return values of the block. In the first
iteration, line 2 evaluates to `false`, so line 5 is executed. `1` is thus
appended to the final array that `map` will return.

On iterations 2 and 3, the `if` condition on line 2 evaluates to `true`, so line
3 is executed. Line 3 returns `nil`, and that is what is appended to the final
array twice.
=end