require "pry"
## display results for user
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

def score(tracker)
  "Wins: #{tracker.count('X')}| Losses: #{tracker.count('O')}"
end

## initialize data structures
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = num.to_s }
  new_board
end

win_tracker = Array.new

## modify board
def user(brd)
  puts "Please choose a square."
  square = gets.chomp
  until (1..9).cover?(square.to_i)
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
  unless brd.values.all? { |square| square == "X" || square == "O" }
  ## defense
  ## iterates through remaining possible user choices, if one of those choices wins place O there
    brd.values.each do |square|
      if (1.to_s..9.to_s).cover?(square)
        brd[square.to_i] = "X"
        if win?(horizontal(brd), vertical(brd), diagonal(brd))
          brd[square.to_i] = "O"
        end
        return "O" if brd[square.to_i] == "O"
        brd[square.to_i] = square
      end
    end
##    offense tbd now
    square = rand(1..9)
    until "123456789".include?(brd[square])
      square = rand(1..9)
    end
    brd[square] = "O"
  end
end

## game logic
def win!(player, tracker)
  tracker << player
end

def horizontal(brd)
  i = -1
  3.times do
    i += 1
    if brd[1 + (3 * i)] == brd[2 + (3 * i)] &&
       brd[2 + (3 * i)] == brd[3 + (3 * i)]
      return true
    end
  end
  false
end

def vertical(brd)
  j = -1
  3.times do
    j += 1
    if brd[1 + j] == brd[4 + j] &&
       brd[4 + j] == brd[7 + j]
      return true
    end
  end
  false
end

def  diagonal(brd)
  if (brd[1] == brd[5] && brd[5] == brd[9]) ||
     (brd[3] == brd[5] && brd[5] == brd[7])
    return true
  end
  false
end

def win?(h, v, d)
  true if h || v || d
end

def full?(brd)
  if brd.values.all? { |value| (value == "X" || value == "O") }
    return true
  end
  false
end

def end_game?(brd)
  false
  true if win?(horizontal(brd), vertical(brd), diagonal(brd)) ||
     full?(brd)
end

## game time!
def play(brd, tracker)
  loop do
    user(brd)
    win!("X", tracker) if win?(horizontal(brd), vertical(brd), diagonal(brd))
    break if end_game?(brd)
    computer(brd)
    win!("O", tracker) if win?(horizontal(brd), vertical(brd), diagonal(brd))
    break if end_game?(brd)
    display(brd)
  end
end

play_again = ""
loop do
  board = initialize_board
  display(board)
  play(board, win_tracker)
  puts score(win_tracker)
  if win_tracker.count("X")>4
    puts "User wins!"
    break
  elsif win_tracker.count("O")>4
    puts "Computer wins!"
    break
  end
  puts "Would you like to play again? press Q to quit."
  play_again = gets.chomp
  break if play_again.upcase == "Q"
end
