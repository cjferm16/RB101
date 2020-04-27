SQ_FT_CONV = 10.7639

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

puts "The area of the room is #{length * width} square meters (#{length * width * SQ_FT_CONV} square feet)."
