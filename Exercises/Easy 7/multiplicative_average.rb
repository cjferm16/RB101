def show_multiplicative_average(array)
  number = 1.000
  array.each { |num| number *= num.to_f }
  p "The return is #{('%.3f' % (number / array.size))}"
end

show_multiplicative_average([3, 5])

show_multiplicative_average([6])

show_multiplicative_average([2, 5, 7, 11, 13, 17])
