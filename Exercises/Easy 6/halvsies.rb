def halvsies(array)
  halved = array.length / 2
  arr1 = []
  arr2 = []
  if array.length.even?
    arr1 = array.slice(0..(halved - 1))
    arr2 = array.slice(halved..-1)
  else
    arr1 = array.slice(0..(halved))
    arr2 = array.slice(halved + 1..-1)
  end
  p newarr = [arr1, arr2]
end
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]