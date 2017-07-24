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

def turn(board, player="X")
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    turn(board, player)
  end
end

GAME_OVER = false
# Define your play method below
def play(board)
  numturns = 0
  player = "X"
  until numturns == 9
    turn(board, player)
    player = switch_player(player)
    numturns += 1
  end
end

def switch_player(player)
  if player == "X"
    return "O"
  elsif player == "O"
    return "X"
  end
end

=begin
def win?(board)
#returns true if there are three in a row somewhere in board, false otherwise
  #there are 3 rows, 3 cols, and 3 diags to check

  GAME_OVER = true
end
=end
