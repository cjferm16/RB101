=begin 
Problem:
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.
  Rephrase: 

Examples/tests: 
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

Rules:
  Explicit: 
  - Hash should have 3 categories
  - count all chracters
  Implicit:
  - non-letter/number characters should go in the neither(space, symbols)

Data Structure: 
  INPUT: string
  OUTPUT: hash

Algorithm:
  - given string
  - initialize hash
  - split string into array
  - iterate over array
  - count occurrence of each lettercase type
  - add to hash
  - return hash

C:
=end

def letter_case_count(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    if char.match?(/[a-z]/)
      hash[:lowercase] += 1
    elsif char.match?(/[A-Z]/)
      hash[:uppercase] += 1
    elsif char.match?(/[\W\d]/)
      hash[:neither] += 1
    end
  end
  p hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
