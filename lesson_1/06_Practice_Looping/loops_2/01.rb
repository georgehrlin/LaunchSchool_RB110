count = 1

loop do
  break if count == 6

  if count.odd?
    puts "#{count} is odd!"
  else
    puts "#{count} is even!"
  end

  count += 1
end