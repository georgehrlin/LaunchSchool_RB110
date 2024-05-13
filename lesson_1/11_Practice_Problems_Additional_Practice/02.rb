ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

# Solution 1: Using only methods
p ages.values.sum

# Solution 2: Using an iterative method
sum = 0

ages.each { |_, age| sum += age }

p sum

# Remember to use `_` as block parameter if it is not used