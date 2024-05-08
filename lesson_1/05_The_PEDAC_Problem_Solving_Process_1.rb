# My attempt to write up pseudocode and solve the sub-problem to generate a
# "pyramid" of even numbers with the number of rows that is based on the input.

=begin
Pseudocode for `even_num_pyramid`

Input: Number of rows (`n_rows`)
Output: Two-level nested array with `n_rows` number of sub-arrays

1 Create an empty array `rows` that will contain all the sub-arrays

2 Create a loop that iterates `n_rows` number of iterations
  - In each iteration, append an empty array to `rows`

(Now `rows` has `n_rows` number of empty arrays)

3 Create a local variable `i` that references `0`. `i` serves as the sub-array
  index tracker

5 Create a local variable `current_row` that references `i + 1`. `current_row`
  serves as the indicator of the current row number

7 Create a local variable `current_n` that references `2`. `current_n` serves as
  the tracker for the numebr to be appended.

6 Create a loop that iterates `n_rows` number of times:
  - Create a loop that iterates `row_n` of times:
    * Append the sub-array at index `i` with `current_n + 2 * i`
    * Increment `i` by `1`

8 Return rows
=end

=begin
# My code
def even_num_pyramid(n_rows)
  pyramid = []
  n_rows.times { pyramid << [] }

  i = 0
  current_row = i + 1
  current_n = 0

  n_rows.times do
    current_row.times do 
      current_n += 2
      pyramid[i].append(current_n)
    end

    i += 1
    current_row += 1
  end

  pyramid
end

# Phind AI's improved version of my code
def even_num_pyramid(n_rows)
  pyramid = []
  current_number = 0

  n_rows.times do |row_index|
     row = []
     p row_index
     (row_index + 1).times do
       current_number += 2
       row << current_number
     end
     pyramid << row
  end

  pyramid
end
=end

# Writing out the improved version of my code from recall without looking at Phind AI's version
def even_num_pyramid(num_rows)
  pyramid = []
  starting_num = 0

  num_rows.times do |row_index|
    pyramid[row_index] = []
    (row_index + 1).times do
      pyramid[row_index] << starting_num += 2
    end
  end
  pyramid
end

p even_num_pyramid(4)