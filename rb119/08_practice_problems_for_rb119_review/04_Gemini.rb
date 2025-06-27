def closest_numbers_refined(arr)
  # Handle edge cases where a pair is not possible.
  return [] if arr.nil? || arr.length < 2

  min_difference = Float::INFINITY
  closest_pair = []

  # Iterate through each possible starting number of a pair.
  (0...arr.length).each do |i|
    # Iterate through each subsequent number to form a pair.
    (i + 1...arr.length).each do |j|
      num1 = arr[i]
      num2 = arr[j]
      current_difference = (num1 - num2).abs

      # If we find a new smallest difference, this is our new best pair.
      # Because we are iterating in order, the first pair that sets the
      # final minimum difference will be the one that is kept.
      if current_difference < min_difference
        min_difference = current_difference
        closest_pair = [num1, num2]
      end
    end
  end

  closest_pair
end

# --- Let's run the CORRECTED stress tests ---
puts "Corrected Refined Solution Tests:"

# Original examples from the problem
puts closest_numbers_refined([5, 25, 15, 11, 20]) == [15, 11]
puts closest_numbers_refined([19, 25, 32, 4, 27, 16]) == [25, 27]
puts closest_numbers_refined([12, 22, 7, 17]) == [12, 7]

# My stress tests, now with the correct expected output for test #2
puts closest_numbers_refined([8, 1, 6, 3]) == [8, 6]
# CORRECTED EXPECTATION: The first pair found with the minimum difference (10) is (40, 30).
puts closest_numbers_refined([40, 10, 20, 30, 50]) == [40, 30]
puts closest_numbers_refined([5, 10, 15, 5, 20]) == [5, 5]
puts closest_numbers_refined([-20, -10, 0, -12, 10]) == [-10, -12]
puts closest_numbers_refined([1, 2, 3, 4, 5]) == [1, 2]
puts closest_numbers_refined([100, 1]) == [100, 1]
puts closest_numbers_refined([]) == []
puts closest_numbers_refined([5]) == []

# All of the above should now print 'true'.
