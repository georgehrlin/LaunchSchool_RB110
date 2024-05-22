[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end

# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]