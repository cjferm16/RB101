def staggered_case(string)
  counter = 0
  arr = string.chars
  loop do
    break if counter == arr.size
    if counter.even?
      arr[counter].upcase!
      counter += 1
    elsif counter.odd?
      arr[counter].downcase!
      counter += 1
    else
      arr[counter]
    end
  end
  p arr.join
end  
