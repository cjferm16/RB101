def running_total(array)
  totaled = []
    array.each do |x|
      totaled << totaled.last.to_i + x
    end
  p totaled
end

running_total([2, 5, 13])


#Using each_with_object

def running_total2(array)
  total = 0
  array.each_with_object([]) do |num, arr|
    total += num
    arr << total
  end
end

p running_total2([2, 5, 13, 22])