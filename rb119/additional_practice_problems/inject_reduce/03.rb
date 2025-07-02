=begin
Create a method that takes a string and returns a hash where keys are
characters and values are their frequencies, but only for characters that
appear more than once.

def frequent_chars(string)
end

# Test cases
puts frequent_chars('hello world') == {'l' => 3, 'o' => 2}
puts frequent_chars('programming') == {'r' => 2, 'g' => 2, 'm' => 2}
puts frequent_chars('abcdef') == {}
=end

require 'pry'

def frequent_chars_0(str)
  unique_chars = str.chars.uniq
  unique_chars.reduce({}) do |hsh, char|
    if str.count(char) > 1
      hsh[char] = str.count(char) # This returns the value, not the hash
      hsh
    else
      hsh
    end
  end
end

def frequent_chars_1(str)
  unique_chars = str.chars.uniq
  unique_chars.reduce([]) do |arr, char|
    str.count(char) > 1 ? arr << [char, str.count(char)] : arr
  end.to_h
end

puts frequent_chars_1('hello world') == {'l' => 3, 'o' => 2}
puts frequent_chars_1('programming') == {'r' => 2, 'g' => 2, 'm' => 2}
puts frequent_chars_1('abcdef') == {}
