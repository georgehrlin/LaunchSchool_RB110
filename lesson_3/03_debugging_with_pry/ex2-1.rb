require 'pry'

def word_map(sentence)
  words = sentence.split
  map = {}

  words.each do |word|
    #binding.pry
    if map.key?(word)
      map[word] += 1
    else
      map[word] = 1
    end
  end

  map
end

p word_map('I want what I want') # => {"I"=>2, "want"=>2, "what"=>1}
