=begin
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
=end

=begin
PEDAC
P
Input:
1. An array of integers (but I think it doesn't have to be ints?)
2. A string that is the delimiter between elements of the input array but not
   for the last two elements (in the output string) (default: ',')
3. A string that is the delimiter specifically between the last two elements
   (in the output string) (default 'or')

Output:
- A string made up of elements from input array with most of them separated by
  the second delimiter string and the last two separated by both the second and
  third delimiter string

Implicit:
- When there are only two elements, because they are the last two elements,
  only use the third delimiter str to separate them

E
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

D
Input: An array, a string, a string
Output: A string

A
- Define a method joinor with three parameters: arr, separater, and separater_final
- IF there are only two elements in arr, join elements with separater_final and
  return it
- ELSE
  - Join all elements except last element with separater
  - Append joined elements with last element with separater and separater_final
  - Return joined string
=end

def joinor(arr, separater = ', ', separater_final = 'or')
  if arr.count == 1
    arr[0]
  elsif arr.count == 2
    arr.join(" #{separater_final} ")
  else
    arr[0...-1].join(separater) << "#{separater}#{separater_final} #{arr[-1]}"
  end
end

p joinor([1])                      # => "1"
p joinor([1, 2])
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
