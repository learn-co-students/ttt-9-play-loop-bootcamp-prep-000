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
  moveCounter = 1

  puts "Where would you like to go?"
  puts "Please enter 1-9:"

  input = gets.strip
  index = input_to_index(input)

  if (valid_move?(board, index))
    if (moveCounter.odd?)
      move(board, index, "X")
      display_board(board)
    elsif (moveCounter.even?)
      move(board, index, "O")
      display_board(board)
    end
    moveCounter += 1
  else
    puts "invalid"
    turn(board)
  end
end

# Define your play method below

def play(board)
  for turn in (0..8)
    turn(board)
  end
end
