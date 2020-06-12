=begin 
Problem:
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.
  Rephrase: 

Examples/tests: 
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
Rules:
  Explicit: Amount of new elements in array should be size of first * size of second
  Implicit:

Data Structure: 
  INPUT: 2 arrays
  OUTPUT: 1 array

Algorithm:
- Initialize new array
- Given 2 arrays
- Multiply arr1.size * arr2.size to get size of new arr
- newarr == arr1 each el * each el of array 2

C:
=end

def multiply_all_pairs(arr1, arr2)
  newarr = []
  idx = 0
  arr2.each do |num|
    newarr[idx] = num * arr1.select { |x| x }
    idx += 1
  end
  p newarr
end

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
