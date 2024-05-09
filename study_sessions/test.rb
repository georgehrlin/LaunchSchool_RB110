def evenPercent(n)
  evens = []
  (1..n).each { |num| (evens << num) if (num % 2 == 0) }
  ((evens.size.to_f) / n).round(2)
end

p evenPercent(1) #== 0
p evenPercent(2) #== 0.5
p evenPercent(3) #== 0.33
p evenPercent(12) #== 0.5
p evenPercent(13) #== 0.46