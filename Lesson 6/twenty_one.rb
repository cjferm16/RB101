require 'pry'

SUITS = %w(h s d c)
CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
VALID_ANSWER = %w(h s hit stay)
YES_OR_NO = %w(n no y yes)
DEALER = 'Dealer'
PLAYER = 'Player'
DEALER_LIMIT = 17

def prompt(string)
  puts "=> #{string}"
end

def intiialize_deck(array_of_cards, array_of_suits)
  counter = 0
  array_deck = []
  loop do
    array_of_cards.map do |card|
      array_deck << (card + ' ' + array_of_suits[counter])
    end
    counter += 1
    break if counter == 4
  end
  array_deck
end

def initial_card_deal(deck_of_cards, user_hand, dealer_hand)
  2.times { user_hand << deck_of_cards.delete(deck_of_cards.sample) }
  2.times { dealer_hand << deck_of_cards.delete(deck_of_cards.sample) }
end

def hit(deck_of_cards, user_hand)
  user_hand << deck_of_cards.delete(deck_of_cards.sample)
end

def card_name(string)
  card =
    if !string[0].match?(/(J|Q|K|A|1)/)
      string[0].to_i
    elsif string[0] == '1'
      10
    elsif string[0] == 'J'
      'Jack'
    elsif string[0] == 'Q'
      'Queen'
    elsif string[0] == 'K'
      'King'
    else
      'Ace'
    end
  card.to_s
end

def card_suit(string)
  suit = ''
  case string[-1]
  when 'h'
    suit = ' of Hearts'
  when 's'
    suit = ' of Spades'
  when 'd'
    suit = ' of Diamonds'
  when 'c'
    suit = ' of Clubs'
  end
  suit
end

def card_value(string)
  card =
    if !string[0].match?(/(J|Q|K|A|1)/)
      string[0].to_i
    elsif string[0].match?(/(J|Q|K|1)/)
      10
    elsif string[0] == 'A'
      11
    end
  card
end

def whole_card(hand)
  card_name(hand) + card_suit(hand)
end

def cards_showing(hand_array)
  new_string = ''
  hand_array.each do |card|
    new_string += whole_card(card) + ', '
  end
  new_string
end

def input_validation(string)
  if VALID_ANSWER.include?(string)
    true
  else
    prompt "Not a valid repsonse! Try agian."
  end
end

def yes_or_no_validation(string)
  if YES_OR_NO.include?(string)
    true
  else
    prompt "Not a valid repsonse! Try 'yes' or 'no'."
  end
end

def busted?(user_hand)
  if hand_value(user_hand) > 21
    true
  else
    false
  end
end

def hand_value(user_hand)
  value = 0
  user_hand.each do |card|
    value += card_value(card)
  end
  user_hand.select { |card| card[0] == 'A' }.count.times do
    value -= 10 if value > 21
  end
  value
end

def hand_showing_and_value(user_hand, user)
  prompt "#{user} is showing #{cards_showing(user_hand)}."
  prompt "#{user} value is #{hand_value(user_hand)}."
end

def dealer_hit?(user_hand)
  return true if hand_value(user_hand) < DEALER_LIMIT
end

def player_turn(user_hand, player_var, array_deck)
  hit(array_deck, user_hand)
  hand_showing_and_value(user_hand, player_var)
end

def hit_or_stay
  answer = ''
  prompt "Would you like to hit or stay?"
  loop do
    answer = gets.chomp
    break if input_validation(answer)
  end
  answer
end

def computer_turn(user_hand, player_var, array_deck)
  loop do
    hand_showing_and_value(user_hand, player_var)
    if dealer_hit?(user_hand)
      prompt "Dealer hits!"
      hit(array_deck, user_hand)
      break if hand_value(user_hand) >= 17
      next
    elsif hand_value(user_hand) > 21
      prompt "Dealer busts!"
      break
    else
      prompt "Dealer stays!"
      break if !dealer_hit?(user_hand)
    end
  end
end

def initial_prompt(p_hand, d_hand)
  prompt "Player is showing #{cards_showing(p_hand)}."
  prompt "Player value is #{hand_value(p_hand)}."
  prompt "Dealer is showing #{whole_card(d_hand[0])} and unknown card."
end

def determine_winner(p_hand, d_hand)
  if hand_value(p_hand) == 21
    "Player"
  elsif hand_value(p_hand) <= 21 &&
        (hand_value(p_hand) > hand_value(d_hand))
    "Player"
  elsif busted?(d_hand)
    "Bust"
  elsif hand_value(p_hand) == hand_value(d_hand)
    "Tie"
  else
    "Dealer"
  end
end

def continue
  prompt "Press any key to continue!"
  gets.chomp
end

def prompt_winner(string)
  if string == "Player"
    prompt "Player wins!"
  elsif string == "Tie"
    prompt "It's a push!"
  elsif string == "Bust"
    prompt "Player wins!"
    prompt "Dealer bust!"
  else
    prompt "Dealer wins!"
  end
end
#----------------------------------#

loop do
  score = [0, 0]
  answer = ''

  loop do
    player_hand = []
    dealer_hand = []

    system 'clear'
    deck = intiialize_deck(CARDS, SUITS)
    initial_card_deal(deck, player_hand, dealer_hand)
    initial_prompt(player_hand, dealer_hand)

    loop do
      response = hit_or_stay
      if response.start_with?('h')
        player_turn(player_hand, PLAYER, deck)
      end
      break if !response.start_with?('h') || busted?(player_hand)
    end

    if busted?(player_hand)
      prompt "#{PLAYER} has busted!"
    else
      computer_turn(dealer_hand, DEALER, deck)
      hand_showing_and_value(player_hand, PLAYER)
      hand_showing_and_value(dealer_hand, DEALER)
    end
    winner = determine_winner(player_hand, dealer_hand)
    prompt_winner(winner)

    if winner == 'Player' || winner == 'Bust'
      score[0] += 1
    elsif winner == 'Dealer'
      score[1] += 1
    end
    prompt "Score is: Player: #{score[0]} - Dealer: #{score[1]}"
    continue
    break if score[0] == 5 || score[1] == 5
  end

  if score[0] == 5
    prompt "Player won!"
  elsif score[1] == 5
    prompt "Dealer won!"
  end

  prompt "Would you like to play again?"

  loop do
    answer = gets.chomp
    break if yes_or_no_validation(answer)
  end

  if answer.start_with?('y')
    prompt "Shuffling..."
    sleep(1)
    next
  else
    prompt "Thanks for playing!"
    break
  end
end
