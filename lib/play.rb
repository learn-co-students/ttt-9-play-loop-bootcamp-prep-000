# Learn.co Bootcamp Prep - Ruby Fundamentals - 19: Tic Tac Toe Play Loop

############################### HELPER METHODS ################################
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
    display_board(board)
  else
    turn(board)
  end
end

###############################################################################

# Define a method, 'play', that accepts one parameter(s):
# 'board', an array that represents the current state of the game.
# Simulate a 9 turn Tic Tac Toe game using a loop.
def play(board)
  turn_num = 0
  until turn_num == 9
    turn(board)
    turn_num += 1
  end
end
