=begin
Create a method that takes a string argument and returns a hash in which the
keys represent the lowercase letters in the string, and the values represent
how often the corresponding letter occurs in the string.

Examples:
expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}

The above tests should each print true.
=end

=begin
# Original attempt
# Time spent: 9:50
ALPHABET = ('a'..'z').to_a

def str_lowercase_only(str)
  str.chars.each do |char|
    str.delete!(char) if !ALPHABET.include?(char)
  end
  str
end

def count_letters(str)
  str_lowercase_only(str).chars.tally
end
=end

=begin
NOTE

I went ahead and tried to solve without PEDAC because I thought I could just
use #tally. I thought, with #tally, I just needed to figure out how to remove
the non-alphabetical chars from the input str first, then I could just use
#tally.

However, I did not read the problem closely to understand its requirements
fully. The question wants the method to only count lowercase numbers. I did
figure out how to remove all the non-alphabetical chars, but I needed to remove
the uppercase-letter chars too. It took me some time to realize the mistake I
made and to fix it.

The takeaway here is I must read and understand the problem fully. I should go
over all the provided examples and understand their arguments and return values
fully. The PEDAC process helps me with that.
=end

# Retry with simpler code
def count_letters(str)
  str.chars.select { |char| ('a'..'z').include?(char) }.tally
end
