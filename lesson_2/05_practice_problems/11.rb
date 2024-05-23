arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

p (arr.map do |subarr|
  subarr.select do |n|
    n % 3 == 0
  end
end)

p (arr.map do |subarr|
  subarr.reject do |n|
    n % 3 != 0
  end
end)