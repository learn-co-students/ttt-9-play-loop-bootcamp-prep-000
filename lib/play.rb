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
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def has_won?(board)
  won = false
  row1 = [board[0], board[1], board[2]]
  row2 = [board[3], board[4], board[5]]
  row3 = [board[6], board[7], board[8]]
  col1 = [board[0], board[3], board[6]]
  col2 = [board[1], board[4], board[7]]
  col3 = [board[2], board[5], board[8]]
  dia1 = [board[0], board[4], board[8]]
  dia2 = [board[2], board[4], board[6]]

  rowCols = [row1, row2, row3, col1, col2, col3, dia1, dia2]

  rowCols.each do |row|
    if row[0] + row[1] + row[2] == "XXX" || row[0] + row[1] + row[2] == "OOO"
      won = true
    end
  end
  won
end

def moves_left?(board)
  moves_left = false
  board.each_with_index do |square, index|
    if valid_move?(board, index)
      moves_left = true
    end
  end
  moves_left
end

def play(board)
  #better way!
  #until !moves_left?(board) || has_won?(board) do
  #  turn(board)
  #end
  counter = 1
  until counter == 10 do
    turn(board)
    counter += 1
  end
end
