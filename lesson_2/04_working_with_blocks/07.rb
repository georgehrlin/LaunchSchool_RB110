arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

p arr.sort
# => [['1', '8', '11'], ['1', '8', '9'], ['2', '12', '15'], ['2', '6', '13']]

=begin
When sorting nested arryas there are two sets of comparison happening:
1. Each of the inner arrays is compared with the other inner arrays.
2. The way those arrays are compared is by comparing the elements within them.
=end

p (arr.sort_by do |subarr|
  subarr.map { |n| n.to_i }
end)

# => [['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]