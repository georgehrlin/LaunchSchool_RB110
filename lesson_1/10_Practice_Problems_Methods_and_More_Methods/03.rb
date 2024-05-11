[1, 2, 3].reject do |num|
  puts num
end

=begin
Without running the code, I'd guess that the return value is `[1, 2, 3]`.

The method call returns an array with the same value as the calling array
(without rejecting any of its element) because of the return value of the block.
The block always returns `nil`, and it is falsy. Therefore, none of the elements
of the calling array meet the criterion to be rejected, and the method call
returns an array with the original value.
=end