hash = { a: 'ant', b: 'bear' }
p (hash.shift)
p hash

=begin
`shift` is a mutating method that removes the first element of the calling
collection (add-on: first key-value pair of the calling hash) and returns it
(add-on: as a two-element array).
Therefore, line 2 returns `[:a, "ant"]`, and `hash` now references `{:b=>'bear'}`.

We can find out by passing `hash.shift` to `p` and passing `hash` to `p`.
=end