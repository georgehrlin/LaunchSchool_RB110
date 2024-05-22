# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

p arr.sort { |a, b| b.to_i <=> a.to_i }
p arr.sort_by { |n| -n.to_i}
p arr.sort { |a, b| a.to_i <=> b.to_i }.reverse