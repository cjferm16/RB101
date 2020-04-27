puts "Enter the first number:"
first = gets.chomp.to_i

puts "Enter the second number:"
second =  gets.chomp.to_i

puts "Enter the third number"
third = gets.chomp.to_i

puts "Enter the fourth number:"
fourth = gets.chomp.to_i

puts "Enter the fifth number:"
fifth = gets.chomp.to_i

puts "Enter the last number:"
sixth = gets.chomp.to_i

arr = []
arr.push(first, second, third, fourth, fifth)

if arr.include?(sixth)
  puts "The number #{sixth} appears in #{p arr}."
else
  puts "The number #{sixth} does not appear in #{p arr}."
end
