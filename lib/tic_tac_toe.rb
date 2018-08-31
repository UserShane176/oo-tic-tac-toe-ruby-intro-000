class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

 WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
 ]

 def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, character)
  @board[index] = character
end


def position_taken?(index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(index)
   !position_taken?(board, index) && index.between?(0,8)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
counter
end

def current_player
  return turn_count(board).even? ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if win_combo.all? do |win_index|
      board[win_index] == "X"
    end
    true
  elsif win_combo.all? do |win_index|
      board[win_index] == "O"
    end
    true
  else
    false
  end
 end
end

def full?
   board.all? {|po| po != " "}
end

def draw?
  if full?(board) == true && !won?(board) == true
    true
  end
end

def over?
   if won?(board) != nil ||  draw?(board) == true
     true
   else
     false
   end
end

def winner
  WIN_COMBINATIONS.find do |win_combo|
    if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
      return "X"
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
      return "O"
    else
      nil
    end
  end
end

def play
  until over?(board)
     turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
  won?(board)
end

end
