require "yaml"
MESSAGES = YAML.load_file('payment_calculator_messages.yml')

def clear
  print "\e[2J\e[f"
end

def prompt(message)
  puts("=> #{message}")
end

def retrieve_input(input_type)
  prompt(MESSAGES[input_type])
  input = nil
  loop do
    input = gets.chomp
    break if valid_input?(input, input_type)
    prompt(MESSAGES["#{input_type}_invalid"])
  end
  prompt("#{input_prompt(input, input_type)}")
  input.to_f
end

def input_prompt(input, input_type)
  case input_type
  when "loan"
    prompt("You've entered $#{input}.")
  when "apr"
    prompt("You've entered #{input}%.")
  when "duration"
    prompt("You've entered #{input} years.")
  end
end

def valid_input?(input, input_type)
  case input_type
  when "loan"
    integer?(input) && number?(input)
  when "apr"
    apr_valid?(input)
  when "duration"
    number?(input) && duration_valid?(input)
    input.to_i * 12
  end
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def apr_valid?(input)
  input.to_i >= 0 && input.to_i <= 100
end

def number?(input)
  input.to_f > 0
end

def duration_valid?(input)
  !(input.include? '.')
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
  The total loan duration is #{duration.to_i * 12} months.
  The total monthly interest is #{monthly_interest} points.
  ----------------------------------------------
  MSG
end

def monthly(loan_amount, monthly_interest, duration)
  if monthly_interest > 0
    loan_amount *
      (monthly_interest / (1 - (1 + monthly_interest)**(-1 * (duration * 12))))
  else
    loan_amount / duration
  end
end
#------------------------------------------------------------------------------------------------------------#
prompt(MESSAGES['begin'])

user_name = nil
loop do
  user_name = gets.chomp
  if user_name.empty? || user_name == " "
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

  loan_amount = retrieve_input('loan')

  apr = retrieve_input('apr')
  
  duration = retrieve_input('duration')
  
  monthly_interest = ((apr / 100) / 12).round(5)

  halfway(type, loan_amount, apr, duration, monthly_interest)

  puts "Your monthly payment is:
    $#{monthly(loan_amount, monthly_interest, duration).round(2)}!"

  puts "Would you like to make another calculation? (Enter y to go again)"
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

puts "Goodbye!"
