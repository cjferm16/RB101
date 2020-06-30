def fibonacci(int)
  idx = 0
  fibarr = [1, 1]
  while fibarr.size < int
    fibarr << fibarr[idx] + fibarr[idx + 1]
    idx += 1
  end
  p fibarr.last 
end
