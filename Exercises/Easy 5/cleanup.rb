=begin 
Problem: Given a string that consists 
of some words (all lowercased) and an 
assortment of non-alphabetic characters, 
write a method that returns that string with 
all of the non-alphabetic characters replaced 
by spaces. If one or more non-alphabetic 
characters occur in a row, you should only have 
one space in the result (the result should never
have consecutive spaces).
  Rephrase: Given a string of varying character, write a method that returns the string with
  only letters, and replace all symbols with spaces
Examples/tests: 
  cleanup("---what's my +*& line?") == ' what s my line '
INPUT: String
OUTPUT: String
Rules:
    Explicit:
    - Must use a method 
    - Must return a string
    - All returned characters must be letters and spaces
    - The returned string should not consist of consecutive spaces
    Implicit:
    - 

D: 
- String -> array
- array perform seeking and replacing
- rejoin elements

Approach:
- String -> array
- array of expressions into sub-array
- sub-array, identify all non-letter values, replace with spaces
- iterate over each elemnt of the subarray and return uniq non-letter values
- rejoin elements into single string
C:
=end

def cleanup(string)
  string.gsub(/\W+/, ' ')
end
p cleanup("---what's my +*& line?")