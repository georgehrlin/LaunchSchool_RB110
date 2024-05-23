arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

=begin
incremented_arr = (arr.map do |hsh|
  hsh.each_key do |letter|
    hsh[letter] += 1
  end
end)
=end
# This is wrong because the question asks for "without modifying the original
# array"

incremented_arr = (arr.map do |hsh|
  hsh.each_with_object({}) do |(k, v), o|
    o[k] = v + 1
  end
end)

p incremented_arr
p arr

# Official Solution
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.each_with_object([]) do |hsh, arr|
  incremented_hsh = {}
  hsh.each do |k, v|
    incremented_hsh[k] = v + 1
  end
  arr << incremented_hsh
end