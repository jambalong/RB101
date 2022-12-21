# Rock Paper Scissors Spock Lizard

VALID_MOVES = {
  "r" => "rock",
  "p" => "paper",
  "sc" => "scissors",
  "sp" => "spock",
  "l" => "lizard"
}

# Player move beats Computer moves
WIN_MATRIX = {
  "rock" => %w[scissors lizard],
  "paper" => %w[rock spock],
  "scissors" => %w[paper lizard],
  "spock" => %w[rock scissors],
  "lizard" => %w[paper spock]
}

# Win 'x' rounds to win the game
WIN_STATE = 3

# Messages for prompts
MESSAGES = {
  moves: <<-MSG,
Please type in your move:

  'r'  = Rock
  'p'  = Paper
  'sc' = Scissors
  'sp' = Spock
  'l'  = Lizard

MSG
  welcome: "Welcome to Rock, Paper, Scissors, Spock, Lizard Game! \n\n",
  player_name: "Enter your player name:",
  greeting: "Hello, %{name}. Let's begin!\n\n",
  what_move: "What is your move %{name}?",
  not_valid: "That is not a valid move. Try again!",
  computer_move: "Computer is deciding their move...\n\n",
  player: "Player chose: %{move}",
  computer: "Computer chose: %{move}\n\n",
  win: "Awesome. You win this round!",
  tie: "Well... It's a tie. Next round!",
  lose: "This time, Computer wins the round!",
  game_won: "Congratulations! You have beaten the computer! You WIN!",
  game_lost: "Better luck next time! Computer has won the game!",
  again: "Play again? [y/n]",
  goodbye:
    "Thank you for playing the Rock Paper Scissors Spock Lizard GAME!!!~"
}

# Adds '=>' to prompted messages
def prompt(message)
  puts "=> #{message}"
end

# Asks the player for their move
def what_move?(name)
  prompt format(MESSAGES[:what_move], name: name)

  get_move
end

# Gets a valid player move input
def get_move
  loop do
    move = gets.chomp.downcase

    if VALID_MOVES.include?(move)
      move = VALID_MOVES[move]
      return move
    else
      prompt MESSAGES[:not_valid]
    end
  end
end

# Checks each player moves and returns which player wins
def who_wins?(player_move, computer_move)
  if WIN_MATRIX[player_move].include?(computer_move)
    "player"
  elsif player_move == computer_move
    "tie"
  else
    "computer"
  end
end

# Checks player counts and returns whoever won
def game_winner?(player, computer)
  player > computer ? :game_won : :game_lost
end

# Displays win messages based on the round result
def display_results(result)
  if result == "player"
    prompt MESSAGES[:win]
  elsif result == "tie"
    prompt MESSAGES[:tie]
  else
    prompt MESSAGES[:lose]
  end
end

# Display Player and Computer moves
def display_moves(player_move, computer_move)
  prompt format(MESSAGES[:player], move: player_move)
  sleep(0.5)
  prompt format(MESSAGES[:computer], move: computer_move)
  sleep(1)
end

# Display Player and Computer counters
def display_counter(player, computer)
  prompt "Player: #{player}"
  sleep(0.5)
  prompt "Computer: #{computer}\n\n"
  sleep(1)
end

# Shows what moves each player has chosen
def show_moves
  prompt MESSAGES[:moves]
end

# Checks if either player has achieved WIN_STATE
def game_end?(player, computer)
  player == WIN_STATE || computer == WIN_STATE ? true : false
end

# Welcome message and takes the player's name
prompt MESSAGES[:welcome]
sleep(0.5)

prompt MESSAGES[:player_name]
name = gets.chomp

puts "\n"
sleep(0.5)

# Main Game loop
loop do
  # Initialize win counters to zero whenever Main Game starts
  player_count = 0
  computer_count = 0

  prompt format(MESSAGES[:greeting], name: name)
  sleep(1)

  # Game Rounds loop
  loop do
    show_moves
    # Asks for player move
    player_move = what_move?(name)

    # Computer move made through VALID_MOVES 's values sampled
    computer_move = VALID_MOVES.values.sample
    prompt MESSAGES[:computer_move]
    sleep(1)

    # Display both player's move
    display_moves(player_move, computer_move)

    # Display the results of the round
    display_results(who_wins?(player_move, computer_move))
    sleep(1)

    # Player and Computer win counter calculation based on result
    player_count += 1 if who_wins?(player_move, computer_move) == "player"
    computer_count += 1 if who_wins?(player_move, computer_move) == "computer"

    # Display Player and Computer win counter
    display_counter(player_count, computer_count)

    # Breaks the game round loops when either player reaches three wins
    break if game_end?(player_count, computer_count)
  end

  # Display who won the game
  prompt MESSAGES[game_winner?(player_count, computer_count)]

  # Asks whether to play again, if not then end the program
  prompt MESSAGES[:again]
  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end

prompt MESSAGES[:goodbye]
