def triangle(a1, a2, a3)
  angle_arr = [a1, a2, a3]
  return :invalid if angle_arr.uniq.size == 1 || angle_arr.include?(0)
  return :right if angle_arr.uniq.include?(90)
  return :obtuse if angle_arr.any? { |angle| angle > 100 }
  return :acute if angle_arr.all? { |angle| angle < 90 }
end
  
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid