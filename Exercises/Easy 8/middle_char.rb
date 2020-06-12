def center_of(string)
  mid = string.size/2
  if string.size % 2 == 1
    string[mid]
  else
    string[mid-1..mid]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
