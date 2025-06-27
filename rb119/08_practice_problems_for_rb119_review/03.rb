=begin
Create a method that takes a string argument and returns a copy of the string
with every second character in every third word converted to uppercase. Other
characters should remain the same.

Examples:
original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected

The above tests should each print true.
=end

=begin
PEDAC
P
Input: A str that is mostly like a sentence
Output: A new str that is the input str but every second character of every
        third word is upcased

E
original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected

D
Input: A str
Intermediary: An arr of strs
Output: A str

A
- Split input str into an arr of word strs
- Iterate over every third word
  - Upcase every second char of the word
- Combine and return the sentence str
=end

# Original attempt
# Time spent: 19:05
def to_weird_case(sentence)
  words = sentence.split

  2.step(words.length - 1, 3) do |i_every_3rd|
    1.step(words[i_every_3rd].length - 1, 2) do |i_char_every_2nd|
      words[i_every_3rd][i_char_every_2nd] = 
        words[i_every_3rd][i_char_every_2nd].upcase
    end
  end

  words.join(' ')
end

# Version from LSBot review
def to_weird_case(sentence)
  sentence.split.map.with_index do |word, word_index|
    if (word_index + 1) % 3 == 0
      word.chars.map.with_index do |char, char_index|
        char_index.odd? ? char.upcase : char
      end.join
    else
      word
    end
  end.join(' ')
end
