require 'pry'

def my_method(num)
  a = 1
  binding.pry
  b = 2
end

c = 3

my_method(c)
