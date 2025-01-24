=begin
PEDAC
P
Input: Borad, which is a hash with 1 to 9 as keys and player/computer marks as
       vals
Output: Boolean val of whether any of the rows has 2 sqaures in a row marked by
        player

E
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

board = {1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>"O", 6=>" ", 7=>"O", 8=>" ", 9=>" "}
immediate_threat?(board) # => true
board = {1=>" ", 2=>"X", 3=>"X", 4=>" ", 5=>"O", 6=>" ", 7=>"O", 8=>" ", 9=>" "}
immediate_threat?(board) # => true
board = {1=>"X", 2=>" ", 3=>"X", 4=>" ", 5=>"O", 6=>" ", 7=>"O", 8=>" ", 9=>" "}
immediate_threat?(board) # => false
board = {1=>"O", 2=>" ", 3=>" ", 4=>"X", 5=>"X", 6=>" ", 7=>" ", 8=>"O", 9=>" "}
immediate_threat?(board) # => true
board = {1=>"O", 2=>" ", 3=>" ", 4=>" ", 5=>"X", 6=>"X", 7=>" ", 8=>"O", 9=>" "}
immediate_threat?(board) # => true

A
- IF board[1] and board[2] marked with 'X' AND board [3] marked with ' ' OR
     board[2] and board[3] marked with 'X' AND board [1] marked with ' ' OR
     board[4] and board[5] marked with 'X' AND board [6] marked with ' ' OR
     board[5] and board[6] marked with 'X' AND board [4] marked with ' ' OR
     board[7] and board[8] marked with 'X' AND board [9] marked with ' ' OR 
     board[8] and board[9] marked with 'X' AND board [7] marked with ' ' OR 
  - RETURN true
=end

def immediate_threat?(brd)
  WINNING_LINES.each do |line|
    return true if (brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER == 1))
  end
  false
end

def computer_defends(brd)
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*line).count(INITIAL_MARKER == 1))
      line.each { |sqaure| return sqaure if brd[square] == ' ' }
    end
end

def computer_places_piece!(brd)
  if immediate_threat?(brd)
    computer_defends!(brd)
  else
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end