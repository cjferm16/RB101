def list(numbs)
  numbs.to_s.split('').map! { |num| num.to_i }
end

puts list(12345) == [1, 2, 3, 4, 5]   
puts list(7) == [7]                   
puts list(375290) == [3, 7, 5, 2, 9, 0]
puts list(444) == [4, 4, 4] 