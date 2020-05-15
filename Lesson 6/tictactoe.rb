WINNING_LINES =
  [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
  [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = "\u{2716}"
COMPUTER_MARKER = "\u{00A9}"
VALID_ANSWER = %w(y yes n no)

# rubocop:disable Metrics/AbcSize:
def display_board(brd)
  system 'clear'
  puts "You're \u{2716}, Computer is \u{00A9}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize:

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def welcome
  prompt "\u{2716} Welcome to Tic Tac Toe! \u{00A9}"
  prompt "First to 5 wins!"
  prompt "Would you like to go first?"
  prompt "This will determine who goes first until a winner is declared!"
  prompt "Please enter a response:"
end

def input_validity(user_input)
  if VALID_ANSWER.include?(user_input)
    true
  else
    prompt "Invalid choice. Try 'y, yes, n, or no'"
  end
end

def yes_or_no(choice)
  if choice == 'y' || choice == 'yes'
    true
  else
    false
  end
end

def display_score(array)
  prompt "The score is:"
  prompt "Player: #{array[0]}"
  prompt "Computer: #{array[1]}"
  prompt "Ties: #{array[2]}"
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def prompt(string)
  puts "=> #{string}"
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_defense(setup)
  square = nil
  WINNING_LINES.each do |line|
    if setup.values_at(*line).count(PLAYER_MARKER) == 2 &&
       setup.values_at(*line).count(INITIAL_MARKER) == 1
      square =
        (line.select { |value| value if setup[value] == INITIAL_MARKER })
      square = square[0]
    end
  end
  square
end

def computer_offense(setup)
  square = nil
  WINNING_LINES.each do |line|
    if setup.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       setup.values_at(*line).count(INITIAL_MARKER) == 1
      square =
        (line.select { |value| value if setup[value] == INITIAL_MARKER })
      square = square[0]
    end
  end
  square
end

def who_goes_first(choice, brd, scre)
  if choice
    player_goes_first(brd, scre)
  else
    computer_goes_first(brd, scre)
  end
end

def player_goes_first(board, score)
  loop do
    display_board(board)
    display_score(score)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
end

def computer_goes_first(board, score)
  loop do
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    display_board(board)
    display_score(score)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
end

def computer_pick_square_5(brd)
  5 if brd[5] == INITIAL_MARKER
end

def computer_random_pick(brd)
  empty_squares(brd).sample
end

def computer_places_piece!(brd)
  sqr =
    computer_offense(brd) ||
    computer_defense(brd) ||
    computer_pick_square_5(brd) ||
    computer_random_pick(brd)
  brd[sqr] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(array, joiner = ', ', word = 'or')
  temp_arr = []
  array.each do |num|
    temp_arr << num.to_s
  end
  if temp_arr.length <= 1
    temp_arr[0]
  elsif temp_arr.length == 2
    temp_arr[-1].prepend(word + ' ')
    temp_arr.join(' ')
  else
    temp_arr[-1].prepend(word + ' ')
    temp_arr.join(joiner)
  end
end

#------------------------------------------------------------#

loop do
  score = [0, 0, 0]
  response = ''
  answer = ''
  system 'clear'
  welcome

  loop do
    response = gets.chomp.downcase
    break if input_validity(response)
  end

  loop do
    board = initialize_board

    who_goes_first(yes_or_no(response), board, score)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == 'Player'
        score[0] += 1
      elsif detect_winner(board) == 'Computer'
        score[1] += 1
      end
    else
      score[2] += 1
      prompt "It's a tie!"
    end
    break if score[0] == 5 || score[1] == 5
  end

  prompt "Player: #{score[0]} - Computer: #{score[1]} - Ties: #{score[2]}"
  prompt "Play again? (y or n)"

  loop do
    answer = gets.chomp.downcase
    break if input_validity(answer)
  end

  if input_validity(answer) && yes_or_no(answer)
    next
  elsif input_validity(answer) && !yes_or_no(answer)
    break
  end
end

prompt "Thanks for playing Tic Tac Toe! Good bye"
