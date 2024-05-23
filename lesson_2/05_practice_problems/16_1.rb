=begin
def generate_UUID
  digits = []
  ('0'..'9').each { |n| digits << n }
  ('a'..'f').each { |l| digits << l }

  result = ''
  sections = [8, 4, 4, 4, 12]
  sections.each do |num|
    num.times { result << digits.sample }
    result << '-'
  end
  result[0...36]
end
=end

# Official Solution
=begin
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' if index <= sections.size - 2
  end

  uuid
end
=end

# Further Exploration
require 'random/formatter'
p Random.uuid