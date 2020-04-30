def multisum(num)
  arr = (1..num).to_a
  sumarr = []
  arr.each do |x|
    if x % 3 == 0 || x % 5 == 0
      sumarr << x
    else
      next
    end
  end
  p sumarr.sum
end

multisum(5)
multisum(3)
multisum(10)
multisum(20)
multisum(1000)


def multisum2(num)
  newa = (1..num).reduce(0) do |sum,x|
    if x % 3 == 0 || x % 5 == 0
      sum + x
    else
      sum
    end
  end
  p newa
end

multisum2(5)
multisum2(3)
multisum2(10)
multisum2(20)
multisum2(1000)

