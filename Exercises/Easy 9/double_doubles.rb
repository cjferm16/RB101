def twice(int)
  arr = int.digits
  if arr.size == 2 && arr[0] == arr[1]
    int
  elsif arr.size/2 > 1 && 
        arr[0..arr.size/2-1] == arr[arr.size/2..-1] &&
        arr.size != 3
    int
  else
    int * 2
  end
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10