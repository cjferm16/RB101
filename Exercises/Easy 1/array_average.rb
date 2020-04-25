def average(array)
  avg = 0
  count = 0
  array.each do |x|
    avg += x
    count += 1
  end
  float = (avg/count.to_f)
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])