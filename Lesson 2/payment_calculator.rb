require "yaml"
MESSAGES = YAML.load_file('payment_calculator_messages.yml')

def clear
  print "\e[2J\e[f"
end

def prompt(message)
  puts("=> #{message}")
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

prompt(MESSAGES['begin'])

user_name = nil
loop do
  user_name = gets.chomp
  if user_name.empty?
    prompt(MESSAGES['invalid_name'])
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
      prompt(MESSAGES['type_house'])
      break
    elsif type == 2
      prompt(MESSAGES['type_car'])
      break
    else
      prompt(MESSAGES['type_invalid'])
    end
  end

  loan_amount = nil
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp.to_i
    if loan_amount > 0
      prompt("You've entered $#{loan_amount}.")
      break
    else
      prompt(MESSAGES['amount_invalid'])
    end
  end

  apr = nil
  loop do
    prompt(MESSAGES['apr_amount'])
    apr = gets.chomp.to_f
    if apr >= 0 && apr <= 100
      prompt("You've entered #{apr} %.")
      break
    else
      prompt(MESSAGES['apr_invalid'])
    end
  end

  duration = nil
  loop do
    prompt(MESSAGES['duration'])
    duration = gets.chomp.to_i
    if duration > 0
      duration *= 12
      prompt("Your total loan duration is #{duration} months.")
      break
    else
      prompt(MESSAGES['duration_invalid'])
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
