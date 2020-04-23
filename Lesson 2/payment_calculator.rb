def clear
  print "\e[2J\e[f"
end

def confirmation(arg)
  if arg == 'y'
    puts "Excellent! Let's continue"
  elsif arg == 'n'
    puts "No? Hmmm... Let's try again"
  else
    puts "I don't recognize that input, try 'y' or 'n'."
  end
end

def loan_type(type)
  if type == 1
    'home'
  else
    'vehicle'
  end
end

def halfway(type, loan_amount, apr, duration, monthly_interest)
  puts <<-MSG
  It looks like we'll be getting the monthly payment for a #{loan_type(type)} loan with the following details:
  The loan amount is for $#{loan_amount}.
  The APR is #{apr} %.
  The total loan duration is #{duration} months.
  The total monthly interest is #{monthly_interest}
  MSG
end

def monthly(loan_amount, monthly_interest, duration)
  if monthly_interest > 0
  loan_amount *
    (monthly_interest / (1 - (1 + monthly_interest)**(-1 * duration)))
  else
    loan_amount / duration
  end
end

puts "To enter the calculator, please enter your name:"

user_name = nil
loop do
  user_name = gets.chomp
  if user_name.empty?
    puts "Please enter a valid name"
  else
    break
  end
end

loop do
  clear
  puts <<-MSG
  Hello #{user_name}! Welcome to the payment calculator.
  Will you be purchasing a home or a vehicle?
  Press 1 for home or 2 for vehicle:
  MSG

  type = nil
  loop do
    type = gets.chomp.to_i
    if type == 1
      puts "Congratulations! What an exciting time for you."
      break
    elsif type == 2
      puts "Vroom vroom! Let's go for a drive!"
      break
    else
      puts "Please enter 1 or 2 to proceed."
    end
  end

  loan_amount = nil
  loop do
    puts "How much do you plan on borrowing (Integers only! e.g. 20000, 360000)"
    loan_amount = gets.chomp.to_i
    if loan_amount > 0
      puts "You've entered $#{loan_amount}."
      break
    else
      puts "Please enter a valid loan amount."
    end
  end

  apr = nil
  loop do
    puts "What is your APR? (Floats and Integers only! (e.g. 3.5, 10, etc.)"
    apr = gets.chomp.to_f
    if apr >= 0
      puts "You've entered #{apr} %."
      break
    else
      puts "Your APR must be greater than 0"
    end
  end

  duration = nil
  loop do
    puts "What is the duration of the loan in years? (e.g. 12, 5, 1, etc.)"
    duration = gets.chomp.to_i
    if duration > 0
      duration *= 12
      puts "Your total loan duration is #{duration} months."
      break
    else
      puts "You must enter a valid loan duration."
    end
  end

  monthly_interest = ((apr / 100) / 12).round(5)

  halfway(type, loan_amount, apr, duration, monthly_interest)

  puts "Your monthly payment is $#{monthly(loan_amount, monthly_interest, duration).round(2)}!"
  
  puts "Would you like to make another calculation? (Enter y to go again)"
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

puts "Goodbye!"
