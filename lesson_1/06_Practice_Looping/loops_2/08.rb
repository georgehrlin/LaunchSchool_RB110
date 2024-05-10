number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# Further Exploration
=begin
`next` has to be placed after the incrementation of `number` because, if it is
placed before the incrementation, the odd number `1` would be printed. `next`
also has to be placed before `puts` because otherwise it would lose the
functionality to skip when `number` references an odd number.
=end