[1, 2, 3].any? do |num|
  puts num
  p num.odd?
end

=begin
The block's return value is `true` when `num` references `1` and `3`, and `false`
when `num` references `2`. It is determined by line 3, because it is the last
line of expression of the block. `odd?` returns `true` if the calling number
is odd and `false` if the calling number is even.

The return value of `any?` is `true`, because the block evaluates to `true` for
at least one element of the calling array.

I am guessing this code only outputs `1` on the console because of short-circuiting.
=end