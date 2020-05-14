require 'pry'

WINNING_LINES =
  [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
  [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength:
def display_board(brd, scre)
  system 'clear'
  puts "You're X, Computer is O"
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
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength:

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
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
        (line.select { |value| value if setup[value] == INITIAL_MARKER})
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
        (line.select { |value| value if setup[value] == INITIAL_MARKER})
      square = square[0]
    end
  end
 square
end

def computer_random_pick(brd)
  empty_squares(brd).sample
end


def computer_places_piece!(brd)
  sqr = 
  computer_offense(brd) ||
  computer_defense(brd) ||
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
  score = [0, 0]

  loop do
    board = initialize_board

    loop do
      display_board(board, score)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
    display_board(board, score)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == 'Player'
        score[0] += 1
      elsif detect_winner(board) == 'Computer'
        score[1] += 1
      end
    else
      prompt "It's a tie!"
    end
    break if score[0] == 5 || score[1] == 5
  end
    prompt "Player: #{score[0]} - Computer: #{score[1]}"
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break unless answer.downcase == 'y'
  end


prompt "Thanks for playing Tic Tac Toe! Good bye"
