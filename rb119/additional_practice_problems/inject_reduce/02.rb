=begin
Write a method that takes an array of strings and returns a single string with
all words joined together, separated by a space, but only include words that
have more than 3 characters.

def join_long_words(words)
end

# Test cases
puts join_long_words(['cat', 'dog', 'elephant', 'bird']) == 'elephant bird'
puts join_long_words(['ruby', 'is', 'awesome', 'fun']) == 'ruby awesome'
puts join_long_words(['a', 'bb', 'ccc']) == ''
=end

require 'pry'

def join_long_words(words)
  words.reduce([]) do |result, str|
    if str.size > 3
      result << str
    else
      result
    end
  end.join(' ')
end

puts join_long_words(['cat', 'dog', 'elephant', 'bird']) == 'elephant bird'
puts join_long_words(['ruby', 'is', 'awesome', 'fun']) == 'ruby awesome'
puts join_long_words(['a', 'bb', 'ccc']) == ''
