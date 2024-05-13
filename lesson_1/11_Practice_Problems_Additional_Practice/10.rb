munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

=begin
munsters.each_value do |info|
  if info["age"] < 18
    info["age_group"] = 'kid'
  elsif (info["age"] > 18 && info["age"] < 65)
    info["age_group"] = 'adult'
  else
    info["age_group"] = 'senior'
  end
end
=end

# Using `case`
munsters.each_value do |info|
  case info["age"]
  when 0...18
    info["age_group"] = 'kid'
  when 18...65
    info["age_group"] = 'adult'
  else
    info["age_group"] = 'senior'
  end
end

p munsters == {
  "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
}