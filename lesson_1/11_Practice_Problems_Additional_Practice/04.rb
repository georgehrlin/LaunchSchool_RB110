ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

# Solution 1: Using only methods
p ages.values.min # Output: 10

# If, instead, the question asks for the key-value pair with the minimum age:
p ages.slice(ages.key(ages.values.min))