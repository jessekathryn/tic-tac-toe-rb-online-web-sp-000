def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input) 
  if valid_move?(board, index)
    move(board, index, current_player(board)) 
    display_board(board)
  else 
  turn(board)
end
end

def input_to_index(user_input)
 user_input.to_i - 1
end

def move(board, index, value) 
  board[index] = value
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
  end
    
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn_count(board)
turns = 0   
board.each do |token|
if token == "X" || token == "O" 
turns += 1
end
end
turns
end

def current_player(board)
  if turn_count(board) % 2 == 1 
    "O"
  else
    "X"
end 
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    end 
  end
    false
end

def full?(board)
  board.each do |space|
    if space == " "
     return false  
    end 
  end
end

def draw?(board)
    if full?(board) && !won?(board)
      return true
    else 
      return false
  end  
 end

def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
      else 
        return false
      end
   end
 
def winner(board)
  combo = won?(board)
    if !won?(board) 
      return nil
     elsif board[combo[0]] == "X"
        return "X"
     elsif board[combo[0]] == "O"
        return "O"
    end
  end
  
def play(board)
  until over?(board)
  turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
        elsif draw?(board)
          puts"Cat's Game!"
      end
    end
