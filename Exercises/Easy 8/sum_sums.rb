def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end
  p accumulator
  p sum_total
end

sum_of_sums([1, 2, 3, 4, 5])