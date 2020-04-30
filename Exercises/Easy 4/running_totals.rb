def running_total(array)
  totaled = []
    array.each do |x|
      totaled << totaled.last.to_i + x
    end
  p totaled
end

running_total([2, 5, 13])