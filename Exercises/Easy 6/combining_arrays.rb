def merge(array1, array2)
 p array1.zip(array2).flatten.uniq!.sort
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]