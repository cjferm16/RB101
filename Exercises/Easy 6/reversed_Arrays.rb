require 'pry'
def reverse!(array)
  newarr = []
  counter = 0
  while array.length != 0
    newarr << array.pop
  end
  loop do     
    array.push(newarr[counter])
    break if counter == newarr.length
    counter += 1
  end
  array.pop
  array
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

p list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

p list = []
p reverse!(list) == []
p list == []