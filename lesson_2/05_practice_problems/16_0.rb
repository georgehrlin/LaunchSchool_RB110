ALPHANUMERIC = %w(a b c d e f 0 1 2 3 4 5 6 7 8 9)

def generate_UUID
  result = ''
  8.times { result += ALPHANUMERIC.sample}
  result += '-'
  4.times { result += ALPHANUMERIC.sample}
  result += '-'
  4.times { result += ALPHANUMERIC.sample}
  result += '-'
  4.times { result += ALPHANUMERIC.sample}
  result += '-'
  12.times { result += ALPHANUMERIC.sample}
  result
end

p generate_UUID
p generate_UUID
p generate_UUID
p generate_UUID
p generate_UUID