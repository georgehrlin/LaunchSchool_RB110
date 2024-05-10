names = ['Sally', 'Joe', 'Lisa', 'Henry']

i = 0

loop do
  puts names[i]
  i += 1
  break if i == names.size
end

# Official Answer
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end

# Further Exploration
names = ['Sally', 'Joe', 'Lisa', 'Henry']
loop do
  puts names.pop
  break if names.empty?
end