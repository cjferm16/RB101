def triangle(num)
  counter = 1
  num.times do
    puts ' ' * num + '*' * counter
    num -= 1
    counter += 1
  end
end

triangle(5)
triangle(9)
triangle(14)