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

#with until loop:::
def play(board) #play method initiates a simple loop and calls #turn
  until board == ["X","X","X","X","X","X","X","X","X",]
    turn(board) #calls turn method
  end #end while loop
end #end play(board) method


### while loop example:

# num_of_hotdogs_eaten = 0
# while num_of_hotdogs_eaten < 7
#   num_of_hotdogs_eaten += 1
#   puts "You have now eaten #{num_of_hotdogs_eaten} hot dog(s)."
# end


### until loop example:

# counter = 0
# until counter == 20
#   puts "The current number is less than 20."
#   counter += 1
# end
