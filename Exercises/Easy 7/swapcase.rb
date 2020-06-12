def swapcase(string)
  arr = []
  string.chars.map! do |letter|
    if letter.match?(/[A-Z]/)
      arr << letter.downcase
    else
      arr << letter.upcase
    end
  end 
  arr.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
