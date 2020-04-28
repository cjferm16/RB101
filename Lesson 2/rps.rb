VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
VALID_CHOICES2 = ['r', 's', 'l', 'p']

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

def win?(first, second)
  condition = {
    'rock': ['scissors', 'lizard'],
    'paper': ['rock', 'spock'],
    'scissors': ['paper', 'lizard'],
    'lizard': ['spock', 'paper'],
    'spock': ['rock', 'scissors']
  }
  condition[first.to_sym].include?(second)
end

def clarity(clarifier)
  loop do
    puts "spock or scissors?"
    clarifier = gets.chomp
    if clarifier == 'spock'
      clarifier = 'spock'
      break
    elsif clarifier == 'scissors'
      clarifier = 'scissors'
      break
    else
      prompt("That is not a correct value. (hint: enter 'spock' or 'scissors')")
    end
  end
  clarifier
end

def input_validation(input)
  if input == 'r'
    input = 'rock'
  elsif input == 'p'
    input = 'paper'
  elsif input == 's'
    clarity(input)
  elsif input == 'l'
    _input = 'lizard'
  else
    prompt('That is not a valid input')
  end
end

def results(person, machine)
  if win?(person, machine)
    "You won! :)"
  elsif win?(machine, person)
    "Computer won! :("
  else
    "You tied!"
  end
end

#--------------------------------------------------------#
loop do
  human_score = []
  computer_score = []
  response = nil
  prompt("First to 5 wins!")
  loop do
    choice = nil
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      elsif VALID_CHOICES2.include?(choice)
        choice = input_validation(choice)
        break
      else
        prompt('Not an option! Try again.')
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}; Computer chose #{computer_choice}.")

    if results(choice, computer_choice).include? ':('
      p results(choice, computer_choice)
      computer_score << 1
    elsif results(choice, computer_choice).include? ':)'
      p results(choice, computer_choice)
      human_score << 1
    end

    prompt("The score is #{human_score.sum} to #{computer_score.sum}")

    if human_score.length == 5
      prompt("You win!")
      break
    elsif computer_score.length == 5
      prompt("Computer wins! Better luck next time")
      break
    end
  end

  loop do
    prompt("Would you like to play again?")
    response = gets.chomp.downcase
    if response == 'y' || response == 'yes'
      break
    elsif response == 'n' || response == 'no'
      break
    else
      puts "Invaid response! Try 'yes' or 'no'"
    end
  end

  if response == 'y' || response == 'yes'
    clear_screen()
    next
  elsif response == 'n' || response == 'no'
    break
  end
end

prompt("Thank you for playing! Good bye!!")
