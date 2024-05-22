def remove_evens_bad!(arr)
  arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
end

p remove_evens_bad!([1, 1, 2, 3, 4, 6, 8, 9])

# [1, 1, 2, 3, 4, 6, 8, 9] # At index 0, nothing happens
# [1, 1, 2, 3, 4, 6, 8, 9] # At index 1, nothing happens
# [1, 1, 3, 4, 6, 8, 9]    # At index 2, 2 removed
# [1, 1, 3, 6, 8, 9]       # At index 3, 4 removed
# [1, 1, 3, 6, 9]          # At index 4, 8 removed. No index 5, iteration ends.

# Expected return value: [1, 1, 3, 9]

# A much better and the proper way:
def remove_evens_good!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end