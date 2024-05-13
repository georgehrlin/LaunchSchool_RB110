flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Solution 1: Using `map`
hsh1 = flintstones.map { |name| [name, flintstones.index(name)] }.to_h

# Solution 2: Using `loop`
hsh2 = {}
i = 0

loop do
  break if i == flintstones.size

  hsh2[flintstones[i]] = i
  i += 1
end

# Solution 3: Using `each_with_index` After Skimming Official Solution
hsh3 = {}

flintstones.each_with_index { |name, index| hsh3[name] = index }

p hsh1
p hsh2
p hsh3