=begin
`sum_even_number_row`

1 Create an empty array `rows` to hold all of the rows
2 Create a `row` array and add it to the overall `rows` array
  - Extracted as a sub-problem: Create a Row
3 Repeat step 2 until all the necessary rows have been created
  - All the rows have been created when the length of `rows` is equal to the input integer
4 Sum the final row and return it

Loop created from steps 2 to 3:
Until all the necessary rows have been created (when length of `rows` is equal to the input integer):
  1 Create `row`
  2 Add it to the overall `rows` array

Calculating `start_integer`:
Rule: First integer of a row == last integer of the previous row + 2
Algorithm:
1 Get the last row of `rows`
2 Get the last integer of that row
3 Add 2
=end

def sum_even_number_row(row_number)
  rows = []
  start_integer = 2

  # until rows.size == row_number
  (1..row_number).each do |current_row_number|
    rows << row = create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end

  rows.last.sum
end

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(3) == 30
p sum_even_number_row(4) == 68

=begin
Sub-Problem: Create a Row `create_row`

1 Create an empty `row` to contain the integers
2 Add the starting integer
3 Increment the starting integer by 2 to get the next integer in the sequence
4 Repeat steps 2 and 3 until `row` has reached the correct length
5 Return `row`

Loop created from steps 2 to 4:
Until the size of `row` is equivalent to `row_length`
  1 Add `start_integer` to `row`
  2 Increment `start_integer` by 2
=end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer

  until row.size == row_length # Step 4 implies a loop with a stated condition
    row << current_integer
    current_integer += 2
  end
  row
end

=begin
p create_row(2, 1)  == [2]
p create_row(4, 2)  == [4, 6]
p create_row(8, 3)  == [8, 10, 12]
p create_row(14, 4) == [14, 16, 18, 20]
=end