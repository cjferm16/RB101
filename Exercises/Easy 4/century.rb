def which_century(year)
 century = (year - 1) / 100
 century += 1
end

def suffix(century)
  append = which_century(century).to_s
  if append.end_with?('0','11', '12', '13','5', '6', '7', '8', '9')
    return append + "th"
  elsif append.end_with?('1')
    return append + 'st'
  elsif append.end_with?('2')
    return append + 'nd'
  elsif append.end_with?('3')
    return append + 'rd'
  end
  p append
end

p suffix(2020)
p suffix(5)
p suffix(256)
p suffix(1983)
p suffix(1883)
p suffix(1001)
p suffix(11201)