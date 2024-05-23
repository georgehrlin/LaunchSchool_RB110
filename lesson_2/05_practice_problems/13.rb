arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

p arr.sort

p (arr.sort_by do |subarr|
  odds = ''
  subarr.each do |n|
    odds += n.to_s if n.odd?
  end
  odds
end)

# Official Solution
p (arr.sort_by do |subarr|
  subarr.select { |n| n.odd? }
end)