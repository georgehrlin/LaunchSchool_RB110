loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Incorrect answer. Please answer "yes".' # Sugged by official solution
end