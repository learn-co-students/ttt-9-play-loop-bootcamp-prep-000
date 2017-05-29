# Helper Methods
def displayBoard(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def inputIndex(input)
  input.to_i - 1
end

def move(board, index, currentPlayer = "X")
  board[index] = currentPlayer
end

def positionTaken?(board, position)
  board[position] != " " && board[position] != ""
end

def validMove?(board, index)
  index.between?(0,8) && !positionTaken?(board, index)
end

def turn(board)
  puts "Please enter a number from 1-9:"
  input = gets.strip
  index = inputIndex(input)
  if validMove?(board, index)
    move(board, index)
    displayBoard(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  turnNum = 0
  while turnNum < 9
    turn(board)
    turnNum += 1
  end
end
