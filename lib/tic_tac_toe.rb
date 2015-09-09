def play(board)
  loop do
    turn(board)
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "--------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "--------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, input)
  input.to_i.between?(1,9) && !position_taken?(board, input.to_i-1)
end

def turn(board)
  display_board(board)
  puts "Please enter 1-9:"
  input = user_input
  if valid_move?(board, input)
    move(board, input)  
  else
    turn(board)
  end
end

def user_input
  gets.strip
end

def position_taken?(board, location)
  board[location] != " "
end

def move(board, location)
  board[location.to_i-1] = "X"
end