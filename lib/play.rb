# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index)
  else 
    turn(board)
  end 
end

# Define your play method below

def play(board)
  
  9.times do
    turn(board)
  end 

end

# def won?(board)
#   row0 = board[0..2]
#   row1 = board[3..5]
#   row2 = board[6..8]
#   col0 = board[0], board[3], board[6]
#   col1 = board[1], board[4], board[7]
#   col2 = board[2], board[5], board[8]
#   diag1 = board[0], board[4], board[8]
#   diag2 = board[6], board[4], board[2]
  
#   possibles = [row0, row1, row2, col0, col1, col2, diag2, diag1]
  
#   possibles.each do |poss|
#     return true if poss.flatten.uniq.length == 1 && poss.flatten.uniq != " "
#   end 
#   false 
# end 
