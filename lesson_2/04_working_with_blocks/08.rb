[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    p (if item.to_s.to_i == item
      item > 13
    else
      item.size < 6
    end)
  end
end

# => [[27], ["apple"]]