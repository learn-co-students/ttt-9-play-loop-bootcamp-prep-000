def valid_move?(board,index)
  ((0...9).include? index) && !position_taken?(board,index )
end


def position_taken?(board,index)
  cell = board[index]
  !(cell.nil? ||  cell.empty? || cell == " ")
end

def display_board(board)
  b = []
  (0...board.size-2).step(3) { |i|  b << board[i..i+2].map {|letter| " #{letter} "}.join("|")}
  sep = "-" * b[0].size
  puts b.join("\n" + sep + "\n")
end

def input_to_index(id)
  id.to_i - 1
end

def move(board,index,player="X")
  board[index] = player
end


def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  until valid_move?(board,index)
    index = input_to_index(gets.strip)
  end
  move(board,index)
  display_board(board)
end
