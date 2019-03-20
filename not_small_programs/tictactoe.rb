##display results for user
def display(brd)
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts "\n"
end

##initialize data structures
def initialize_board
  new_board = {}
  (1..9).each  {|num| new_board[num] = "#{num}"}
  new_board
end

##modify board
def user(brd)
  puts "Please choose a square."
  square = gets.chomp
  until (1..9).include?(square.to_i)
    puts "I'm sorry, that is not a valid square. Select 1-9."
    square = gets.chomp
  end
  until "123456789".include?(brd[square.to_i])
    puts "I'm sorry, that square is taken. Select another."
    square = gets.chomp
  end
  brd[square.to_i] = 'X'
end

def computer(brd)
  if win?(brd)[0] || full?(brd)
    return
  end
  square = rand(1..9)
  until "123456789".include?(brd[square])
    square = rand(1..9)
  end
  brd[square] = "O"
end

##game logic
def win?(brd)
  horizontal = false
  vertical = false
  diagonal = false
  winner = ""
  ##horizontal
  i = 0
  3.times do 
    if brd[1+3*i] == brd[2+3*i] && brd[2+3*i] == brd[3+3*i]
      horizontal = true
      winner = brd[1+3*i] 
    end
    i += 1
  end
  ##vertical
  j = 0
  3.times do
    if brd[1+j] == brd[4+j] && brd[4+j] == brd[7+j] 
      vertical = true
      winner = brd[1+j]  
    end
    j += 1
  end
  ##diagonal
  if (brd[1] == brd[5] && brd[5] == brd[9]) || (brd[3] == brd[5] && brd[5] == brd[7])
    diagonal = true
    winner = brd[5]
  end
  [horizontal || vertical || diagonal, winner]
end

def full?(brd)
  brd.all? do |square, value|
    value == 'X' || value == 'O'
  end
end

##game time!
def play(brd)
  until win?(brd)[0] || full?(brd)
    user(brd)
    computer(brd)
    display(brd)
    puts "#{win?(brd)[1]}'s win!"  if win?(brd)[0]
    puts "It's a draw!" if full?(brd) && (win?(brd)[0]==false)
  end
end

play_again = ""
while play_again.upcase != "Q"
  board = initialize_board
  display(board)
  play(board)
  puts "Would you like to play again? press Q to quit."
  play_again = gets.chomp
end

