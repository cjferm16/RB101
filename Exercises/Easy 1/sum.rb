def sum(int)
  p int.to_s.split('').map(&:to_i).reduce(:+)
end


sum(23)