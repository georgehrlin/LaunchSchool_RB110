flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# My Solution
def find_BE(arr)
  result = nil
  arr.each_with_index do |name, index|
    if name.include?("Be")
      result = index
      break
    end
  end
  result
end

p find_BE(flintstones)
# This is not a good solution because it does not work for the rare edge case
# (assuming that all the strings are proper first names) where a name includes
# but does not start with `Be`

# Official Solution
p flintstones.index { |name| name[0..1] == 'Be' }