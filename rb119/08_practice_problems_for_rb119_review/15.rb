=begin
Create a method that takes a string argument that consists entirely of numeric
digits and computes the greatest product of four consecutive digits in the
string. The argument will always have more than 4 digits.

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6

The above tests should each print true.
=end

=begin
PEDAC
P
Input: A str of only numeric digits and always with more than 4 digits
Output: An int that is the largest possible product from multiplying four
        CONSECUTIVE digits from input str

E
p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6

D
Input: A str
Intermediary: An arr of arrs of ints
Output: An int

A
HELPER: Return the product of an arr of ints
- Initialize a var, result, to track product
- Iterate over arr of ints
  - Update result to the product of *= current int
- Return result

- Convert input str to an arr of individual digits
- Use #each_cons to generate an arr of all possible four-consecutive nums arrs
- Use #max_by and HELPER to find the largest possible product
=end

# Original attempt
# Time spent: 16:38
def arr_product(arr)
  result = 1
  arr.each { |n| result *= n }
  result
end

def greatest_product(str_n)
  arr_four_consecutive = []
  str_n.to_i.digits.reverse.each_cons(4) do |four_digits|
    arr_four_consecutive << four_digits
  end

  arr_product(arr_four_consecutive.max_by do |four_digits|
                arr_product(four_digits)
              end)
end
