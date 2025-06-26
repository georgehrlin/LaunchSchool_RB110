=begin
You have to create a method that takes a positive integer number and returns
the next bigger number formed by the same digit.

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
=end

=begin
# My solution
def same_digits?(n1, n2)
  n1.digits.sort == n2.digits.sort
end

def possible_larger_int?(int)
  largest_possible_n = ''
  int.digits.sort.reverse.each { |n| largest_possible_n << n.to_s }
  largest_possible_n.to_i > int
end

def next_bigger_num(int)
  input = int
  if !possible_larger_int?(input)
    -1
  else
    loop do
      int += 1
      return int if same_digits?(int, input)
    end
  end
end
=end

# Solution from video
def largest_possible_int(int)
  int.digits.sort.reverse.join.to_i
end

def next_bigger_num(int)
  max = largest_possible_int(int)
  (int + 1..max).each do |n|
    return n if largest_possible_int(n) == max
  end
  -1
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
