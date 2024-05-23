hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

=begin
p (hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].each_with_object([]) do |color, arr|
      arr << color.capitalize
    end
  else
    details[:size].upcase
  end
end)
=end

# Official Solution
p (hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].map do |color|
      color.capitalize
    end
  elsif details[:type] == 'vegetable'
    details[:size].upcase
  end
end)
# Calling `map` and calling each_with_object([]) on an array are the same