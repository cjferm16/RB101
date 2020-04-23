require "pry"
require "yaml"
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def number?(num)
  num != 0
end

def operation_to_message(op)
    case op
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiplying'
    when '4'
      'Dividing'
    end
end
#---------------------------------------------------#
prompt(MESSAGES['welcome'])

name = nil
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt "Hi #{name}!"

loop do
  number1 = nil
  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp.to_i

    if number?(number1)
      break
    else
      prompt(MESSAGES['not_valid'])
    end
  end

  number2 = nil
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp.to_i

    if number?(number2)
      break
    else
      prompt(MESSAGES['not_valid'])
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result.to_f}")

  prompt(MESSAGES['another'])
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thanks'])
