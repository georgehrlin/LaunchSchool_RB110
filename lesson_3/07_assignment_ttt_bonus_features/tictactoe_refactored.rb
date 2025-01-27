ROUNDS_TO_GRAND_WIN = 3
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def player_goes_first?
  loop do
    prompt "Who goes first? Enter '1' for player' or '2' for computer."
    prompt "Or enter '3' to let computer choose. Press Enter after choosing."
    choice = gets.chomp.to_i
    case choice
    when 1
      return true
    when 2
      return false
    when 3
      return [true, false].sample
    else
      prompt "Invalid choice! Please enter '1', '2', or '3'."
    end
  end
end

def display_first(first)
  prompt(first ? 'You are first!' : 'Computer is first!')
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  system 'clear'
  puts "Player score: #{player_score} | " \
       "Computer score: #{computer_score} \n"
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separater = ', ', separater_final = 'or')
  if arr.count == 1
    arr[0].to_s
  elsif arr.count == 2
    arr.join(" #{separater_final} ")
  else
    arr[0...-1].join(separater) << "#{separater}#{separater_final} #{arr[-1]}"
  end
end

def locate_winning_square(brd, marker)
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(marker) == 2) &&
       (brd.values_at(*line).count(INITIAL_MARKER) == 1)
      line.each { |square| return square if brd[square] == INITIAL_MARKER }
    end
  end
  nil
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'Sorry, that is not a valid choice.'
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = (if brd.values.all? { |marker| marker == INITIAL_MARKER }
              empty_squares(brd).sample
              # So that computer doesn't always take 5 when starting
            elsif locate_winning_square(brd, COMPUTER_MARKER) # Offense
              locate_winning_square(brd, COMPUTER_MARKER)
            elsif locate_winning_square(brd, PLAYER_MARKER) # Defense
              locate_winning_square(brd, PLAYER_MARKER)
            elsif brd[5] == INITIAL_MARKER
              5
            else
              empty_squares(brd).sample
            end)

  brd[square] = COMPUTER_MARKER
end

def computer_starts!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
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

def a_single_round(brd, player_score, computer_score, current_player)
  loop do
    display_board(brd, player_score, computer_score)
    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(brd) || board_full?(brd)
  end
end

def announce_round_winner(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie!"
  end
end

def tally_socres_at_end_of_round(brd, player_score, computer_score)
  if detect_winner(brd) == 'Player'
    [player_score + 1, computer_score]
  elsif detect_winner(brd) == 'Computer'
    [player_score, computer_score + 1]
  else
    [player_score, computer_score]
  end
end

def grand_winner?(player_score, computer_score)
  player_score == ROUNDS_TO_GRAND_WIN || computer_score == ROUNDS_TO_GRAND_WIN
end

def announce_grand_winner(brd)
  if detect_winner(brd) == 'Player'
    prompt 'YOU ARE THE GRAND WINNER!'
    sleep(1)
    puts "୧(๑•̀ヮ•́)૭ LET'S GO!!!"
  else
    prompt 'Computer is the grand winner.'
  end
end

loop do # main game loop
  player_score = 0
  computer_score = 0
  board = nil

  prompt 'Welcome to Tic Tac Toe!'
  sleep(1.5)
  player_first = player_goes_first?
  display_first(player_first)
  prompt "Win #{ROUNDS_TO_GRAND_WIN} rounds to be the grand winner! Get ready!"
  sleep(2)

  loop do
    board = initialize_board
    current_player = player_first ? 'player' : 'computer'

    a_single_round(board, player_score, computer_score, current_player)

    display_board(board, player_score, computer_score)

    announce_round_winner(board)

    player_score, computer_score = tally_socres_at_end_of_round(board,
                                                                player_score,
                                                                computer_score)

    prompt 'We have a grand winner...' if grand_winner?(player_score,
                                                        computer_score)

    sleep(1)
    prompt 'Press Enter key to continue.'
    gets.chomp

    break if grand_winner?(player_score, computer_score)
  end

  system('clear')
  announce_grand_winner(board)
  sleep(1.5)

  prompt "Play again? Enter 'y' or 'n' (then press Enter)."
  answer = gets.chomp
  system('clear')
  break unless answer.downcase.start_with?('y')
end

prompt 'Thank you for playing! Good bye.'
