=begin
PEDAC
P
Input: Borad, which is a hash with 1 to 9 as keys and player/computer marks as
       vals
Output: Boolean val of whether any of the rows has 2 sqaures marked by player

E
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

immediate_threat?()
=end
def immediate_threat?(brd) # 2 sqaures in a row marked by player
  
end

def computer_defends!(brd)
  
end

def computer_places_piece!(brd)
  if immediate_threat?(brd)
    computer_defends!(brd)
  else
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end