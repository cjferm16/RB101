vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  counted = []
  array.each do |word|
    if counted.include?(word + ' => ' + array.count(word).to_s)
      next
    else
      counted.push(word + ' => ' + array.count(word).to_s)
    end
  end
  puts counted
end

count_occurrences(vehicles)