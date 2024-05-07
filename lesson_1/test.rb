
def repeat(string=nil, integer=nil)
  return false unless correct_inputs?(string, integer)
  string = string + "\n"
  final_array = []
  while integer > 0
    final_array.push(string)
    integer -= 1
  end
  final_array.join.chomp
end

def correct_inputs?(string, integer)
  return false if integer.to_i < 0
  return false if string.nil? || integer.nil?
  string.is_a?(String) && integer.is_a?(Integer)
end

# numerical value tests

p repeat('string', 2) == "string\nstring"
p repeat('string', 1.5) == false
p repeat('string', 1) == 'string'
p repeat('string', 0) == ''
p repeat('string', -1) == false

# string tests

p repeat('string', 2) == "string\nstring"
p repeat('string string', 2) == "string string\nstring string"
p repeat('', 2) == "\n"
p repeat('26', 2) == "26\n26"
p repeat('-26', 2) == "-26\n-26"


# wrong format tests

p repeat == false
p repeat('string') == false
p repeat(0) == false
p repeat(0, 'string') == false