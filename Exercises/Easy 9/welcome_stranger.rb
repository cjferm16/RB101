def greetings(arr, hsh)
  puts "Hello, #{arr.join(' ')}! Nice to have a #{hsh.values.join(' ')} around!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
