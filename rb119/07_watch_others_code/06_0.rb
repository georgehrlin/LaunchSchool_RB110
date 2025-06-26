=begin
You are going to be given an array of integers. Your job is to take that array
and find an index N where the sum of the integers to the left of N is equal to
the sum of the integers to the right of N. If there is no index that would make
this happen, return -1.

For example:
Let's say you are given an array [1, 2, 3, 4, 3, 2, 1].
Your method will return the index 3, because at the 4th position of the array,
the sum of the left side of the index [1, 2, 3] and the sum of the right side
of the index [3, 2, 1] are both 6.

Another example:
You are given an array [20, 10, -80, 10, 10, 15, 35].
At index 0 the left side is [].
The right side is [10, -80, 10, 10, 15, 35]].
They both are equal to 0 when summed. (Empty arrays are equal to 0 in this
problem.)
Index 0 is the place where the left side and right side are equal.

Examples:
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
=end

=begin
PEDAC
P
Input: An arr of ints
Output: An int that is the idx that separates the input arr into two subarrs of
        left subarr and right subarr where the two subarrs have the same sum
        - Int of this idx is not included in either subarr
        - If such idx cannot be found, return 0
        - Idx can be 0 if the right subarr sums up to 0; same logic applies to
          the last idx

E
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

D
Input: An arr of ints
Intermediary: Arrs of ints potentially
Output: An int

A
- Iterate over input arr with idx
  - Check if left subarr and right subarr sum up to the same number
    - Left subarr is input arr from idx 0 to current idx (non-inclusive)
    - Right subarr is input arr from idx current idx + 1 to last idx
      (inclusive)
    - Return idx immediately if that is the case
- Return -1
=end

def find_even_index(arr)
  arr.each_index do |i|
    subarr_l = arr[0...i]
    subarr_r = arr[(i + 1)..(arr.length - 1)]
    return i if subarr_l.sum == subarr_r.sum
  end

  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
