
def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move? (board, index)
  #con = position_taken? (board, index)
  if index > 8 || index < 0
    false
  elsif (position_taken?(board, index)) == false
    true
  end
end

def position_taken? (board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    false
  else
    true
  end
end

def input_to_index (input)
  output = input.to_i - 1
  return output
end

def move(array, index, char = 'X')
  array[index] = char
  return array
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

def play(board)
  counter = 1
  while counter < 10
    turn(board)
    counter += 1
  end

end
