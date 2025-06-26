=begin
Write a method that, when provided with two arrays, return an array the
elements of which are all the elements not shared by the two arrays.

Examples:
arr_difference(['a'], ['a', 'b']) == ['b']
arr_difference(['a', 'b'], ['b']) == ['a']
arr_difference([1, 2, 2, 3], [1, 2, 3]) == [2]
arr_difference([1, 2, 3], [1, 2, 2, 3]) == [2]
arr_difference([1, 2, 3], [2, 3, 4]) == [1, 4]
arr_difference([1, 1, 2, 3], [2, 3, 4]) == [1, 1, 4]
arr_difference([1, 2, 3], [2, 3, 4, 4]) == [1, 4, 4]
arr_difference([1, 1, 2, 3], [2, 3, 4, 4]) == [1, 1, 4, 4]
=end

=begin
Algorithm

# WRONG
# This doesn't work because array subtraction gets rid of all occurences of any
# ele found in both the caller arr and the argument arr
- Find the arr of shared elements
  - Iterate over arr1 with object, shared_ele
    - IF current ele is found in arr2
      - Find the count of this ele in both arrs
      - Append the smaller count quantity of this ele to shared_ele
  - Return shared_ele
- Use arr subtraction with each of the two input arrs to find the two subarrs
  of elements unique to each input arr
- Concatenate and return these two subarrs of unique elements together
=end

=begin
# WRONG
def arr_difference(arr1, arr2)
  shared_ele = (
    arr1.uniq.each_with_object([]) do |char, result|
      if arr2.include?(char)
        [arr1.count(char), arr2.count(char)].min.times { result << char }
      end
    end)
  
  (arr1 - shared_ele) + (arr2- shared_ele)
end
=end

=begin
# Working solution
def arr_difference(arr1, arr2)
  hsh1 = arr1.tally
  hsh2 = arr2.tally

  result = []

  hsh1.each_key do |k|
    if hsh2.key?(k)
      (hsh1[k] - hsh2[k]).abs.times { result << k }
    else
      hsh1[k].times { result << k}
    end
  end

  hsh2.each_key do |k|
    hsh2[k].times { result << k } if !hsh1.key?(k)
  end

  result
end
=end

# Improved version by ChatGPT
def arr_difference(arr1, arr2)
  hsh1 = arr1.tally
  hsh2 = arr2.tally

  result = []

  (hsh1.keys + hsh2.keys).uniq.each do |k|
    count_diff = (hsh1[k] || 0) - (hsh2[k] || 0)
    count_diff.abs.times { result << k }
  end

  result
end
