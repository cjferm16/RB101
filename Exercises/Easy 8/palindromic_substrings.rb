=begin 
Problem:

  Rephrase: 

Examples/tests: 

Rules:
  Explicit:
  Implicit:

Data Structure: 
  INPUT: string
  OUTPUT: array containing all palindromes in order of 

Algorithm:

C:
=end

def substrings(string)
  newarr = []
  until string.length == 0
    counter = 0
    loop do
      newarr << string[0..counter]
      counter += 1
      break if counter == string.length
    end
    string.delete_prefix!(string[0])
  end
  newarr
end

def palindromes(phrase)
  array = substrings(phrase)
  newarr = []
  array.each do |element|
    if element == element.reverse && element.size > 1
      newarr << element
    else
      next
    end
  end
p newarr
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]