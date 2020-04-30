def integer_to_string(int)
  if int.negative? == true
    int.abs.digits.join('').reverse.prepend('-')
  elsif int == 0
    int.digits.join('').reverse
  else
    int.digits.join('').reverse.prepend('+')
  end
end

p integer_to_string(1233)
p integer_to_string(0)
p integer_to_string(-321)

def integer_to_string2(int)
  stringnums = %w(0 1 2 3 4 5 6 7 8 9 )
  string = int.digits.reverse.map { |num| stringnums[num] }.join
end

p integer_to_string2(1233)
