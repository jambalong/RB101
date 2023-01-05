# Tic Tac Toe with Bonus Features

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd, scores)
  system 'clear'
  puts "Player Score:   #{scores[:player]}"
  puts "Computer Score: #{scores[:computer]}"
  puts ""
  puts "First player to 5 wins the game!"
  puts ""
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice.\n\n"
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # Offense first
  WINNING_LINES.each do |line|
    square = opportunity_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # Defense second
  if !square
    WINNING_LINES.each do |line|
      square = opportunity_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # Pick square 5 if open
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  # Just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def opportunity_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
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

def board_full?(brd)
  empty_squares(brd).empty?
end

def game_end?(scores)
  scores.values.include?(5)
end

def game_winner(scores)
  scores[:player] == 5 ? "Player" : "Computer"
end

def place_piece!(brd, player)
  player == 'Player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(player)
  player == 'Player' ? 'Computer' : 'Player'
end

loop do
  scores = { player: 0, computer: 0 }

  prompt "Who should go first? Player, Computer or Random:"
  answer = gets.chomp

  current_player = answer == 'Random' ? ['Player', 'Computer'].sample : answer

  puts ""
  prompt "The first to make a move: #{current_player}"
  sleep 1.5

  loop do
    board = initialize_board

    alternate_player(current_player)

    loop do
      display_board(board, scores)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    scores[:player] += 1 if detect_winner(board) == 'Player'
    scores[:computer] += 1 if detect_winner(board) == 'Computer'

    display_board(board, scores)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won the round!"
    else
      prompt "It's a tie!"
    end

    sleep 2
    break if game_end?(scores)
  end
  puts ""
  prompt "#{game_winner(scores)} won the game! Congratulations\n\n"

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
