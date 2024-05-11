['ant', 'bat', 'catepillar'].count do |str|
  str.length < 4
end

=begin
By passing the return value of the `count` method call to `p`, I am able to find
out that the return value of `count` is `2`. There are in fact two elements
within the calling array with which `str.length < 4` will return `true`.

Based on the name of the method ("count"), I'd deduce that, after the iterations,
`count` returns the number of times its block returns a truthy value. 

We can find out and confirm my guess by checking the Ruby documentation on the
method `Array#count`.
=end