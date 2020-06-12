=begin
  Algo
  - given string
  - init counter
  - init new array
  - until newarr.size == string.size
    - push << string[0..counter]
end
return new array
  
=end

def substrings_at_start(string)
  newarr = []
  counter = 0
  until newarr.size == string.length
    newarr << string[0..counter]
    counter += 1
  end
  p newarr
end

substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']