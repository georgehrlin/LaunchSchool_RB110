# The PEDAC Process

## Example Question
Imgaine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer presenting the number of a particular row, return an integer representing the sum of all the integers in that row.

## P: Understand the Problem
Input: An integer representing the number of a particular row
Output: An integer representing the sum of all the integers in that particular row

Explicit Requirements:
- There is a sequence of integers
- Sequence begins with 2
- Integers are consecutive even numbers
- Sequence is separated and grouped into rows
- Rows get incrementally larger by one integer
  * The next row always has one more integer than the previous row
- Determine and return the sum of all the integers in a specific row specified by the input number

Implicit Requirements:
- The number of integers in each row is determined by the row's order number
  * 1st row has one integer. 2nd row has two integers. 3rd three...

Visual Representation:
2
4  6
8  10 12
14 16 18 20
...

## E: Examples/Test Cases
Row number: 1 -> Sum of integers in row: 2
Row number: 2 -> Sum of integers in row: 10
Row number: 3 -> Sum of integers in row: 30
Row number: 4 -> Sum of integers in row: 68

## D: Data Structures
- Sequence of rows
- Order of rows is important
- Rows contain integers
- Order of integers is important

A nested array seems a reasonable choice to represent the sequence of rows.

(A sequence with four rows):

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20]
]

## A: Algorithms
1. Create an empty array `rows` to hold all of the rows
2. Create a `row` array and add it to the overall `rows` array
   - (Extracted as a sub-problem: Create a Row)
3. Repeat step 2 until all the necessary rows have been created
   - All the rows have been created when the size of `rows` is equal to the input integer
4. Sum the final row
5. Return the sum

## Sub-Problem: Create a Row
Rules:
- Row is an array
- Array contains integers
- Integers are consecutive even numbers
- Integers in each row form a part of a larger sequence
- Rows are of different lengths

Input: 
- Length of the row
- The starting integer

Output: The row itself (i.e., `[8, 10, 12]` for the third row)

Examples:
(Length: 1 Starting number: 2)  -> [2]
(Length: 2 Starting number: 4)  -> [4, 6]
(Length: 3 Starting number: 8)  -> [8, 10, 12]
(Length: 4 Starting number: 14) -> [14, 16, 18, 20]

Data Structure:
Array

Algorithm:
- Create an empty `row` to contain the integers
- Add the starting integer
- Increment the starting integer by 2 to get the next integer in the sequence
- Repeat steps 2 and 3 until `row` has reached the correct length
- Return `row`

## C: Code with Intent