puts "Please enter an integer greater than 0:"
int = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp

ary = []

if choice == 's'
  int.downto(1) { |n| ary.push(n) }
  sum = ary.sum
  puts "The sum of integers between 1 and #{int} is #{sum}."
elsif choice == 'p'
  prod = 0
  int.downto(1) { |n| ary.push(n) }
  ary.each { |n| prod == 0 ? prod = n : prod *= n }
  p "The product of the integers between 1 and #{int} is #{prod}."
else
  puts "not a valid reponse"
end



