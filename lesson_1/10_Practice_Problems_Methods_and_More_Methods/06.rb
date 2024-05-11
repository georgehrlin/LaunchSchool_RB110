['ant', 'bear', 'caterpillar'].pop.size

=begin
The return value is `11`.

`pop` is a mutating method that removes the last element of the calling array and
returns it. Therefore, `['ant', 'bear', 'catepillar'].pop` returns `catepillar`,
and it is then called on with the method `size`. `size` returns the number of
characters of its caller string, so `11` is the final return value.
=end