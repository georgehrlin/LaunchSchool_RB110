=begin
Write a method that takes two arguments, a string and a positive integer, and
prints the string as many times as the integer indicates.

repeat('Hello', 3)

# Output:
Hello
Hello
Hello
=end

=begin
def repeat(str, n)
  result = ''
  n.times { result += str + "\n" }
  puts result
end
=end

def repeat(str, n)
  result = ''
  while n > 0
    result += str + "\n"
    n -= 1
  end
  p result
  puts result
end

#repeat('Hello', 3)
repeat("a", 5)