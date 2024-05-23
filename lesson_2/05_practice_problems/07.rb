a = 2
b = [5, 8]
arr = [a, b] # arr is assigned [2, [5, 8]] 

arr[0] += 2 # arr[0] and a both reference 2, but here arr[0] is reassigned to 4
arr[1][0] -= a # a still references 2, so arr[1][0] (or b[0]) is reassigned to 3

p a # => 2
p b # => [3, 8]