require 'pry'

def double_num(num)
  num * 2
end

arr = []

[1, 2, 3].each do |num|
  binding.pry
  arr << double_num(num)
end

p arr
