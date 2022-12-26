# Rock Paper Scissors Lizard Spock

require 'yaml'
MESSAGES = YAML.load_file('rps_bonus.yml')

# Win 'x' rounds to win the game
WIN_STATE = 3

# Player move beats Computer moves
WIN_MATRIX = {
  'rock'     => ['scissors', 'lizard'],
  'paper'    => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard'   => ['paper', 'spock'],
  'spock'    => ['rock', 'scissors']
}

VALID_MOVES = {
  'r'  => 'rock',
  'p'  => 'paper',
  'sc' => 'scissors',
  'l'  => 'lizard',
  'sp' => 'spock'
}

# Display Player and Computer counters
def display_counter(player, computer, name)
  system 'clear'
  prompt "#{name}: #{player}"
  sleep(0.5)
  prompt "Computer: #{computer}\n\n"
  sleep(1)
end

# Display Player and Computer moves
def display_moves(player_move, computer_move, name)
  prompt format(messages('player'), move: player_move, name: name)
  sleep(0.5)
  prompt format(messages('computer'), move: computer_move)
  sleep(1)
end

# Displays win messages based on the round result
def display_results(result)
  case result
  when 'player'
    prompt messages('win')
  when 'tie'
    prompt messages('tie')
  when 'computer'
    prompt messages('lose')
  end
end

# Checks if either player has achieved WIN_STATE
def game_end?(player, computer)
  player == WIN_STATE || computer == WIN_STATE ? true : false
end

# Checks player counts and returns whoever won
def game_winner(player, computer)
  player > computer ? 'game_won' : 'game_lost'
end

# Gets a valid player move input
def get_move
  loop do
    move = gets.chomp.downcase

    if VALID_MOVES.include?(move)
      move = VALID_MOVES[move]
      return move
    else
      prompt messages('not_valid')
    end
  end
end

# Display instructions for the game
def instructions
  prompt messages('instructions?')
  answer = yes_no
  return if answer == false
  puts ''
  sleep(0.5)
  prompt messages('rules')
  gets.chomp
end

# Gets the message from YAML
def messages(message)
  MESSAGES[message]
end

# Adds '=>' to prompted messages
def prompt(message)
  puts "=> #{message}"
end

# Shows what moves each player has chosen
def show_moves
  prompt messages('moves')
end

# Asks the player for their move
def what_move(name)
  prompt format(messages('what_move'), name: name)

  get_move
end

# Checks each player moves and returns which player wins
def who_wins(player_move, computer_move)
  if WIN_MATRIX[player_move].include?(computer_move)
    'player'
  elsif player_move == computer_move
    'tie'
  else
    'computer'
  end
end

# Takes yes or no inputs from player
def yes_no
  loop do
    answer = gets.chomp
    if answer.downcase.start_with?('y')
      return true
    elsif answer.downcase.start_with?('n')
      return false
    else
      prompt messages('not_valid')
    end
  end
end

system 'clear'

# Welcome message and takes the player's name
prompt messages('welcome')
sleep(0.5)

instructions()

puts ''
prompt messages('player_name')
name = gets.chomp

puts ''
sleep(0.5)

# Main Game loop
loop do
  # Initialize win counters to zero whenever Main Game starts
  score = {
    player: 0,
    computer: 0
  }

  prompt format(messages('greeting'), name: name)
  sleep(2)

  system 'clear'
  sleep(0.5)
  # Game Rounds loop
  loop do
    show_moves
    # Asks for player move
    player_move = what_move(name)

    # Computer move made through VALID_MOVES 's values sampled
    computer_move = VALID_MOVES.values.sample
    puts ''
    prompt messages('computer_move')
    sleep(1)

    # Display both player's move
    display_moves(player_move, computer_move, name)

    # Display the results of the round
    display_results(who_wins(player_move, computer_move))
    sleep(2)

    # Player and Computer win counter calculation based on result
    score[:player] += 1 if who_wins(player_move, computer_move) == 'player'
    score[:computer] += 1 if who_wins(player_move, computer_move) == 'computer'

    # Display Player and Computer win counter
    display_counter(score[:player], score[:computer], name)

    # Breaks the game round loops when either player reaches three wins
    break if game_end?(score[:player], score[:computer])
  end

  # Display who won the game
  prompt messages(game_winner(score[:player], score[:computer]))

  # Asks whether to play again, if not then end the program
  prompt messages('again')
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

puts ''
prompt messages('goodbye')
