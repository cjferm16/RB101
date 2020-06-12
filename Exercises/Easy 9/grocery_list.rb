def buy_fruit(array)
  newarr = []
  array.map do |array|
    array[1].times do 
      newarr << array[0]
    end
  end
  p newarr
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]