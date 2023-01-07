# Twenty-One

SUITS = %w(H D C S)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
WINSTATE = 5
BUST_LIMIT = 21
DEALER_STAY = BUST_LIMIT - 4


def prompt(msg)
  puts "=> #{msg}"
end

# Initialize deck using SUITS & VALUES
def initialize_deck
  VALUES.product(SUITS).shuffle
end

# Deal from the deck
def deal!(deck)
  deck.pop
end

def deal_initial_hands(deck, player_hand, dealer_hand)
  2.times do
    player_hand << deal!(deck)
    dealer_hand << deal!(deck)
  end
end

def display_hands(player_hand, dealer_hand, player_value)
  prompt "Dealer has: #{dealer_hand[0]} and a [Hidden Card]"
  prompt "Player has: #{player_hand} Hand Value: #{player_value}\n\n"
end

def busted?(value)
  value > BUST_LIMIT
end

def hand_value(hand)
  cards = hand.map { |card| card[0] }

  value = 0

  cards.each do |card|
    value += if 'A'.include?(card) # Ace Card
               11
             elsif 'JQK'.include?(card) # Jack Queen King
               10
             else
               card.to_i
             end
  end

  # Ace value 1 or 11
  cards.select { |card| card == 'A' }.count.times do
    value -= 10 if value > BUST_LIMIT
  end

  value
end

def calculate_result(player_value, dealer_value)
  if player_value > BUST_LIMIT
    :player_busted
  elsif dealer_value > BUST_LIMIT
    :dealer_busted
  elsif player_value > dealer_value
    :player
  elsif dealer_value > player_value
    :dealer
  else
    :tie
  end
end

def display_result(result)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!\n\n"
  when :dealer_busted
    prompt "Dealer busted! You win!\n\n"
  when :player
    prompt "You win!\n\n"
  when :dealer
    prompt "Dealer wins!\n\n"
  when :tie
    prompt "It's a tie!\n\n"
  end
end

def hit_or_stay
  call = nil
  loop do
    prompt "Would you like to [H]IT or [S]TAY?"
    call = gets.chomp.downcase
    break if ['h', 's'].include?(call)
    prompt "Invalid option. Please enter 'h' or 's'"
  end
  call
end

def player_turn(deck, player_hand)
  loop do
    call = hit_or_stay

    if call == 'h'
      player_hand << deal!(deck)
      player_value = hand_value(player_hand)
      prompt "You chose to hit!\n\n"
      sleep 1
      prompt "Your hand: #{player_hand}"
      sleep 0.5
      prompt "Hand value: #{player_value}\n\n"
      sleep 1
    end

    break if call == 's' || busted?(player_value)
  end
end

def dealer_turn(deck, dealer_hand, dealer_value)
  puts "Dealer's turn now...\n\n"
  sleep 1.5

  loop do
    break if dealer_value >= DEALER_STAY

    prompt "Dealer hits!"
    dealer_hand << deal!(deck)
    dealer_value = hand_value(dealer_hand)
    sleep 1
    prompt "Dealer's current hand: #{dealer_hand}\n\n"
    sleep 1
  end
end

def play_again?
  puts "--------------------"
  prompt "Do you want to play again? [y] or [n]"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# Both player and dealer chose to stay, we compare hands
def grand_output(player_hand, dealer_hand, scores)
  player_value = hand_value(player_hand)
  dealer_value = hand_value(dealer_hand)

  puts "===================="
  sleep 0.5
  prompt "Dealer has #{dealer_hand} and Hand Value: #{dealer_value}"
  sleep 0.5
  prompt "Player has #{player_hand} and Hand Value: #{player_value}"
  sleep 0.5
  puts "====================\n\n"
  sleep 1.5

  result = calculate_result(player_value, dealer_value)

  display_result(result)
  update_scores(scores, result)
  sleep 2
end

def display_scores(scores)
  prompt "Player Score: #{scores[:player]}"
  prompt "Dealer Score: #{scores[:dealer]}\n\n"
  sleep 1
end

def display_grandwinner(scores)
  system 'clear'
  display_scores(scores)

  winner = scores.key(WINSTATE)

  case winner
  when :player
    prompt "Congratulations!! You are the Grand Winner!\n\n"
    sleep 1
  when :dealer
    prompt "Better luck next time! The Dealer is the Grand Winner!\n\n"
    sleep 1
  end
end

def update_scores(scores, result)
  case result
  when :player_busted
    scores[:dealer] += 1
  when :dealer_busted
    scores[:player] += 1
  when :player
    scores[:player] += 1
  when :dealer
    scores[:dealer] += 1
  end
end

# Main Game Loop
loop do
  # Initialize Scores
  scores = { player: 0, dealer: 0 }

  # Game Loop
  loop do
    break if scores.values.include?(WINSTATE)

    system 'clear'
    prompt "Welcome to Twenty-One!\n\n"
    sleep 1

    # Display Scores
    display_scores(scores)
    
    # Initialize variables
    deck = initialize_deck
    player_hand = []
    dealer_hand = []

    # Deal initial hands
    deal_initial_hands(deck, player_hand, dealer_hand)

    # Initialize hand values
    player_value = hand_value(player_hand)
    dealer_value = hand_value(dealer_hand)

    # Display initial hands
    display_hands(player_hand, dealer_hand, player_value)

    # Player turn
    player_turn(deck, player_hand)
    player_value = hand_value(player_hand)

    if busted?(player_value)
      grand_output(player_hand, dealer_hand, scores)
      next
    else
      prompt "You chose to stay! Value: #{player_value}\n\n"
      sleep 1
    end

    # Dealer turn
    dealer_turn(deck, dealer_hand, dealer_value)
    dealer_value = hand_value(dealer_hand)

    if busted?(dealer_value)
      grand_output(player_hand, dealer_hand, scores)
      next
    else
      prompt "Dealer chose to stay! Value: #{dealer_value}\n\n"
      sleep 1
    end

    grand_output(player_hand, dealer_hand, scores)
  end

  display_grandwinner(scores)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
sleep 2.5
system 'clear'
