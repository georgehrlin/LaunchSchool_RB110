a = 'hi'
english_greetings = ['hello', a, 'good morning'] # ['hello', 'hi', 'good morning']

greetings = {
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings, # ['hello', 'hi', 'good morning']
  italian: ['buongiorno', 'buonasera', 'ciao']
}

greetings[:english][1] = 'hey' # ['hello', 'hey', 'good morning']
# english_greetings -> ['hello', 'hey', 'good morning']

greetings.each do |language, greeting_list|
  greeting_list.each { |greeting| greeting.upcase! }
end
# english_greetings -> ['HELLO', 'HEY', 'GOOD MORNING']

puts a # hi
puts english_greetings[1] # HEY
puts greetings[:english][1] # HEY