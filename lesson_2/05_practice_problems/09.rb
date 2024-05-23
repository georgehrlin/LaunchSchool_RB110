arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# p (arr.each { |subarr| subarr.sort!.reverse! })

# p (arr.each { |subarr| subarr.sort! { |a, b| b <=> a } } )

# Official Solution
# Using `map` instead of `each`
p (arr.map do |subarr|
  subarr.sort { |a, b| b <=> a }
end)

p arr
# Think `map` and `select` when a new array needs to be returned