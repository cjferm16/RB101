def is_odd?(num)
  abs_value = (num).abs
  abs_value.remainder(2) == 1
end

puts is_odd?(-11)  
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)