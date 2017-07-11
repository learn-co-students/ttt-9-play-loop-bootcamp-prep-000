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

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board, player)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
puts "Welcome to Tic Tac Toe"
player = "X"

turn = 1
while turn < 10
  turn(board, player)
  turn += 1
  if turn % 2 === 0
    player = "O"
  else player = r"X"
    end
end
puts "Thanks for playing!"
puts "Would you like to play again? (y / n)"

if gets.strip === "y"
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  display_board(board)
  play(board)

  #I CAN"T GET THESE THE "N" OPTION TO WORK
# elsif gets.strip === "n"
#   puts "Have a good day"
#    break
#
# else puts "I'm sorry.  I didn't get that.  Would you like to play again?"


end
end
