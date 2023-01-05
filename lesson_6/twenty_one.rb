# Twenty-One

require 'pry-byebug'

SUITS = %w(H D C S)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

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

def display_hands(player_hand, dealer_hand)
  prompt "Dealer has: #{dealer_hand[0]} and a [Hidden Card]"
  prompt "Player has: #{player_hand} Hand Value: #{hand_value(player_hand)}\n\n"
end

def busted?(hand)
  hand_value(hand) > 21
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
    value -= 10 if value > 21
  end

  value
end

def calculate_result(player_hand, dealer_hand)
  player_value = hand_value(player_hand)
  dealer_value = hand_value(dealer_hand)

  if player_value > 21
    :player_busted
  elsif dealer_value > 21
    :dealer_busted
  elsif player_value > dealer_value
    :player
  elsif dealer_value > player_value
    :dealer
  else
    :tie
  end
end

def display_result(player_hand, dealer_hand)
  result = calculate_result(player_hand, dealer_hand)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def player_turn(deck, player_hand)
  loop do
    call = hit_or_stay

    if call == 'h'
      player_hand << deal!(deck)
      prompt "You chose to hit!\n\n"
      sleep 1
      prompt "Your hand: #{player_hand}"
      sleep 0.5
      prompt "Hand value: #{hand_value(player_hand)}\n\n"
      sleep 1
    end

    break if call == 's' || busted?(player_hand)
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

def dealer_turn(deck, dealer_hand)
  loop do
    break if hand_value(dealer_hand) >= 17

    prompt "Dealer hits!"
    dealer_hand << deal!(deck)
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

# Main Game Loop
loop do
  system 'clear'
  prompt "Welcome to Twenty-One! Let's Start!\n\n"
  sleep 1

  # Initialize variables
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  # Deal initial hands
  deal_initial_hands(deck, player_hand, dealer_hand)

  # Display initial hands
  display_hands(player_hand, dealer_hand)

  # Player turn
  player_turn(deck, player_hand)

  if busted?(player_hand)
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  else
    prompt "You chose to stay! Value: #{hand_value(player_hand)}\n\n"
    sleep 1
  end

  puts "Dealer's turn now...\n\n"
  sleep 1.5
  # Dealer turn
  dealer_turn(deck, dealer_hand)

  if busted?(dealer_hand)
    prompt "Dealer's hand value: #{hand_value(dealer_hand)}\n\n"
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  else
    prompt "Dealer chose to stay! Value: #{hand_value(dealer_hand)}\n\n"
    sleep 1
  end

  # Endgame
  puts "===================="
  sleep 0.5
  prompt "Dealer has #{dealer_hand} and Hand Value: #{hand_value(dealer_hand)}"
  sleep 0.5
  prompt "Player has #{player_hand} and Hand Value: #{hand_value(player_hand)}"
  sleep 0.5
  puts "====================\n\n"
  sleep 2

  display_result(player_hand, dealer_hand)
  sleep 1

  puts ""
  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
sleep 2.5
system 'clear'
