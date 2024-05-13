words = "the flintstones rock"

p words.split.each { |word| word.capitalize! }.join(' ')

# Official Solution
words.split.map { |word| word.capitalize }.join(' ')