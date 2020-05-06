=begin 
Problem:Write a method that takes a string argument and returns a new string that 
contains the value of the original string with all consecutive duplicate characters 
collapsed into a single character. You may not use String#squeeze or String#squeeze!.
  Rephrase: Given a string input, remove all consecutive duplicate characters from each word.
Examples/tests: 
  crunch('ddaaiillyy ddoouubbllee') == 'daily double'
  crunch('4444abcabccba') == '4abcabcba'
  crunch('ggggggggggggggg') == 'g'
  crunch('a') == 'a'
  crunch('') == ''


INPUT: String
OUTPUT: String
Rules:
    Explicit:
    - Can not use squeeze method
    - All recurring characters must be collapsed into one
    - No consecutive letters can be present
    Implicit:
    - Likely applies to ALL words, even ones whose proper spelling involves consecutive letters

D: 
- given string
- split string
- identify recurring chars
- remove recurring chars
- rejoin string
- output string

Approach:
- Given string
- split string into individual characters
- iterate over each element
- if (next) element in sequence is == current element
    delete that element
  else
    move to next element
- combine those elements into single string, keeping original spacing.
C:
=end


def crunch(string)
  index = 0
  array = string.split('')

  array.each do |letter|
    if array[index + 1] == letter
      array.delete(letter)
      index += 1
    else
      index += 1
    end
  end
end
p crunch('teeeest string')