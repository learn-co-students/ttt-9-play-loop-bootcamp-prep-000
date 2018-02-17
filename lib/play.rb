def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
   s = input.to_i
   s - 1
end

def position_taken?(board, index)
  taken = nil
  if (board[index] ==  " " || board[index] == "" || board[index] == nil)
  taken = false
  else
  taken = true
  end
end
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, char = "X")
  board[index] = char
end

def turn(board)
  puts "Please enter 1-9:"
  num = gets.strip 
  s = input_to_index(num)
  if valid_move?(board, s) == true
    move(board, s)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
turns = 0 
while turns < 9
  turns += 1
  turn(board)
end
end