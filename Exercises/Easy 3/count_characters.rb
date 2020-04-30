puts "Please enter one word or multiple words:"
string = gets.chomp.to_s

length = string.split(" ").join.length

puts "There are #{length} characters in '#{string}'"