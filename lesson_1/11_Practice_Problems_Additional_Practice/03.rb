age = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Solution 1: Using `select`
less_than_100 = age.select { |_, age| age < 100 }
p less_than_100 # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

# Solution 2: Using `reject`
less_than_100 = age.reject { |_, age| age > 100 }
p less_than_100 # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

# Official Solution
age.keep_if { |_, age| age < 100 }
p age # Output: {"Herman"=>32, "Lily"=>30, "Eddie"=>10}