def repeat(string, integer)
  iterator = 0
  while iterator < integer
    puts string
    iterator = iterator + 1
  end
end

repeat("hello", 3)