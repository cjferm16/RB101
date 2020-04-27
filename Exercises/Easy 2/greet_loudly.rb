puts "What's your name?"
name = gets.chomp

if name.include? '!'
  puts "HELLO #{name.upcase}. WHY ARE WE YELLING?"
else
  puts "Hello #{name}."
end
