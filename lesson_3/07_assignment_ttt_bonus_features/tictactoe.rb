require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  system 'clear'
  puts "Player score: #{player_score} | "+ 
        "Computer score: #{computer_score} \n"
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
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

def immediate_threat?(brd) # 2 sqaures in a row marked by player
  
end

def computer_defends!(brd)
  
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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

loop do # main loop
    player_score = 0
    computer_score = 0
    board = nil

  loop do # 5 wins to be grand winner
    board = initialize_board

    loop do
      display_board(board, player_score, computer_score)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      player_score += 1 if detect_winner(board) == 'Player'
      computer_score += 1 if detect_winner(board) == 'Computer'
      prompt 'We have a grand winner...' if player_score == 5 || computer_score == 5
      sleep(1)
      prompt 'Press Enter key to continue.'
      gets.chomp
      #binding.pry
    else
      prompt "It's a tie!"
      sleep(1)
      prompt 'Press Enter key to continue.'
      gets.chomp
    end

    break if player_score == 5 || computer_score == 5
  end

  system('clear')
  prompt((detect_winner(board) == 'Player') ? 'YOU ARE THE GRAND WINNER!' : 'Computer is the grand winner!')
  sleep(1)
  puts "୧(๑•̀ヮ•́)૭ LET'S GO!" if detect_winner(board) == 'Player'
  sleep(2)
  prompt 'Play again? (y or no)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thank you for playing! Good bye.'
