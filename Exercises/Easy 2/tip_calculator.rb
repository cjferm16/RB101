puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
percent = gets.chomp.to_f

tip = (percent / 100) * bill

total = tip + bill

puts "the tip is $#{tip.round(2)}."

puts "The total is $#{total.round(2)}."
