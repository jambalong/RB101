# Rock Paper Scissors Spock Lizard

VALID_CHOICES = {
  "r" => "rock",
  "p" => "paper",
  "sc" => "scissors",
  "sp" => "spock",
  "l" => "lizard",
}

# Player choice beats Computer choices
WIN_MATRIX = {
  "rock" => %w[scissors lizard],
  "paper" => %w[rock spock],
  "scissors" => %w[paper lizard],
  "spock" => %w[rock scissors],
  "lizard" => %w[paper spock],
}

# Adds '=>' to prompted messages
def prompt(message)
  puts "=> #{message}"
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
def check_count(player_count, computer_count)
  (player_count > computer_count) ? "player_win" : "computer_win"
end

# Displays win messages based on the round result
def display_results(result)
  if result == "player"
    prompt "Awesome. You win this round!"
  elsif result == "tie"
    prompt "Well... It's a tie. Next round!"
  else
    prompt "This time, Computer wins the round!"
  end
end

# Message for choice abbreviations (note: convert all prompts into a MSG hash would be ideal)
choice_msg = <<-MSG
Please type in your move:

  'r'  = Rock
  'p'  = Paper
  'sc' = Scissors
  'sp' = Spock
  'l'  = Lizard

MSG

# Welcome message and takes the player's name
prompt "Welcome to Rock, Paper, Scissors, Spock, Lizard Game! \n\n"
sleep(0.5)

prompt "Enter your player name:"
name = gets.chomp

puts "\n"
sleep(0.5)

# Main Game loop
loop do

  # Initialize win counters to zero whenever Main Game starts again
  player_count = 0
  computer_count = 0

  prompt "Hello, #{name}. Let's begin!\n\n"
  sleep(1)

  choice = ""
  computer_choice = ""

  # Game Rounds loop
  loop do
    prompt(choice_msg)

    choice = ""
    
    # Asks for player move choice loop
    loop do
      prompt "What is your move #{name}?"
      choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        choice = VALID_CHOICES[choice]
        break
      else
        prompt "That is not a valid choice. Try again!"
      end
    end

    # Computer choice made through VALID_CHOICES 's values sampled
    computer_choice = VALID_CHOICES.values.sample
    prompt "Computer is deciding their move...\n\n"
    sleep(1)

    # Display both player's choice
    prompt "Player chose: #{choice}"
    sleep(0.5)
    prompt "Computer chose: #{computer_choice}\n\n"
    sleep(1)

    # Assign which player won to a result variable to be used
    result = who_wins?(choice, computer_choice)

    display_results(result)
    sleep(1)

    # Player and Computer win counter based on result
    player_count += 1 if result == 'player'
    computer_count += 1 if result == 'computer'

    prompt "Player: #{player_count}"
    sleep(0.5)
    prompt "Computer: #{computer_count}\n\n"
    sleep(1)

    # Breaks the game round loops when either player reaches three wins
    break if player_count == 3 || computer_count == 3
  end

  # Figures out who is the winner based on their counter
  winner = check_count(player_count, computer_count)

  if winner == "player_win"
    prompt "Congratulations! You have beaten the computer! You WIN!"
  else
    prompt "That's too bad! Computer has won this game!"
  end

  # Gets answer whether to play again, if not then breaks Main Game loop
  prompt "Play again? [y/n]"
  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end

prompt "Thank you for playing the Rock Paper Scissors Spock Lizard GAME!!!~"
