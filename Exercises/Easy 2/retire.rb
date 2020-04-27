puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement = gets.chomp.to_i

current_year = Time.now.year
puts "It's #{current_year}. You will retire in #{current_year + (retirement - age)} "
puts "You only have #{retirement - age} years to go!"