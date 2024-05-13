flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name = name[0..2]
end

p flintstones

# Mostly correct, but code can be more succinct

# Official Solution
flintstones.map! { |name| name[0, 3]}