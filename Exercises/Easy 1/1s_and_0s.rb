def stringy(num)
  array = []
  num.downto(1) { |n| array.push(n) }
  array.map! do |x|
    if x.even?
      x = 1
    else
      x = 0
    end
  end
  p array.join('')
end

p stringy(24) 