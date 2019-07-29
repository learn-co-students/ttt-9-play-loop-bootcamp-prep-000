# Helper Methods
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  puts 'display board'
end 

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
#CHECK FOR EMPTY SPACE
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#IS # CORRECT & SPACE EMPTY?
def valid_move?(board, index)

  if index.between?(0,8) && !position_taken?(board, index)
      puts 'this is a valid move'
    return true
  else
   return false
  end
end

#COUNTER FOR PLAYER ASSESMENT
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1
  end
end
return counter
end

#WHICH PLAYER IS THIS?
def current_player(board)
  if turn_count(board)%2 ==0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end


#MAKE MOVE ON BOARD
def move(board, index, token)
  board[index] = token
  play(board)
  
end


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]



#HAS ANYONE WON? return false if no. return win_combo if yes
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    #check for player 1 win
    if check_win_combination?(board, 'X', win_combo)
      return win_combo
      #check for player 2 win
    elsif check_win_combination?(board, 'O', win_combo)
      return win_combo
    else
      return false
    end
  end
end

#CHECK WINNING COMBOS
def check_win_combination?(board, player, win_combo)
  win_combo.all? do |position|
    board[position] == player
  end
end

#IS BOARD FULL? 
def full?(board)
  if board.include?(' ') || board.include?('')
    return false
else
    return true
  end
end

#IS THERE A DRAW?
def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

#HAS SOMETHING HAPPENED?
def over?(board)
  puts 'is it over?'
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    puts 'no keep going'
    return false
  end
end

#WHO WON?
def winner(board)
  if !won?(board)
    return nil
  else WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(board, 'X', win_combo)
      return 'X'
    elsif check_win_combination?(board, 'O', win_combo)
      return 'O'
    end
  end
end
end


def play(board)
  until over?(board) == true || won?(board) != false
  puts 'turn'
    turn(board)
  end
  if winner(board)
    puts "Congratulations!"
  elsif draw?(board)
    puts "Draw!"
  else
    return nil
  end
end

display_board(board)
play(board)