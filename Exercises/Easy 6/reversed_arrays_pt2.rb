def reverse(array)
  newarr = []
  clonearr = array.dup
  while clonearr.length != 0
    newarr << clonearr.pop
  end
  newarr
end



p reverse([1,2,3,4]) == [4,3,2,1]          
p reverse(%w(a b e d c)) == %w(c d e b a)  
p reverse(['abc']) == ['abc']              
p reverse([]) == []                        

p list = [1, 3, 2]                      
p new_list = reverse(list)              
p list.object_id != new_list.object_id  
p list == [1, 3, 2]              
p new_list == [2, 3, 1]                 