def multiply_list(arr1, arr2)
  counter = 0
  newarr = []
  loop do
    newarr << arr1[counter] * arr2[counter]
    counter += 1
    break if counter == arr1.size
  end
  p newarr
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


def multiply_lists_zip(arr1, arr2)
  p newarr = arr1.zip { |arr2| arr2 *= arr1}
end

multiply_lists_zip([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
