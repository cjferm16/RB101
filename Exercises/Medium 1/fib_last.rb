def fibonacci(int)
  idx = 0
  fibarr = [1, 1]
  while fibarr.size < int
    fibarr << fibarr[idx] + fibarr[idx + 1]
    idx += 1
  end
  fibarr.last 
end

def fibonacci_last(fib)
  fibonacci(fib).to_s.chars[-1].to_i
end

p fibonacci_last(10)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(11) 
p fibonacci_last(12) 
p fibonacci_last(13) 
p fibonacci_last(14) 
p fibonacci_last(15) 
p fibonacci_last(16) 
p fibonacci_last(17) 
p fibonacci_last(18) 
p fibonacci_last(19)
p fibonacci_last(20)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(21) 
p fibonacci_last(22) 
p fibonacci_last(23) 
p fibonacci_last(24) 
p fibonacci_last(25) 
p fibonacci_last(26) 
p fibonacci_last(27) 
p fibonacci_last(28)
p fibonacci_last(29)
