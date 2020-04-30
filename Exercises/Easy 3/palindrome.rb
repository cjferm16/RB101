def palindrome?(string)
  p string.reverse == string
end

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("mada m'i'madam") == false # (all characters matter)
palindrome?('356653') == true


def palindrome2?(array)
  p array.reverse == array
end

palindrome2?([1,2,3,2,1])
palindrome2?([1,2,3,4,5,6,5,4,3,2,1])
palindrome2?([1,4,1,5,32,32])


def palindrome3?(arg)
  p arg.reverse == arg
end

palindrome3?('madam')
palindrome3?([1,2,3,2,1])