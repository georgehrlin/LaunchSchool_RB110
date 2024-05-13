# I've never seen `take` before so I'll look it up in the docs
arr = [1, 2, 3, 4, 5]
p (arr.take(2))
p arr

=begin
After reading the docs quickly, I now know that `take` returns the first
elements of the collection depending on the argument number.

(The official solution describes `take` that it "selects a specified number of
elements from an array.")

Therefore, I think line 3 returns `[1, 2]`.

`take` could be destructive. If it is, then it'd be an alias of `shift`. Let me
find out by passing line 3 to `p` and passing `arr` to `p`.
=end

# After passing `arr` to `p`, I learned that `take` is not destructive.