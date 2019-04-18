require "pry"

PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"

## Initialize board
def init_board(n)
  board = {}
  (1..n.pow(2)).each {|square| board[square] = square.to_s}
  board
end

## Prints a board of n*n squares. There is a bug with the display for games 10+
def display(brd, n)
  spaces = "     "
  v_border = "|"
  h_border = "-----"
  cross = "+"
##  system "clear"
  n.times do |column|
    3.times do |blank_row|
      n.times do |x| 
        print spaces unless blank_row == 1
        print "  "+"#{brd[(column)*n+(x+1)]}"+"  " if blank_row == 1 && brd[(column)*n+(x+1)].length == 1
        print "  "+"#{brd[(column)*n+(x+1)]}"+" " if blank_row == 1 && brd[(column)*n+(x+1)].length == 2
        ## Spacing bug here ^
        print v_border if x<n-1
      end
    print "\n"
    end
    if column < n-1
      n.times do |break_row|
        print h_border
        print cross if break_row<n-1
      end
    end  
    print "\n"
  end
end

## Shows available legal moves (returns a hash of available spaces)
def empty_spaces(brd, n)
  brd.select {|k, v| k == v.to_i}
end

## Check if board is full
def full?(brd, n)
  empty_spaces(brd, n).empty?
end

## Finds all possible winning lines and returns an array of arrays [rows, columns diagonals]
## where rows, columns, and diagonals are arrays of (integer) keys in the winning lines
def winning_lines(n)
  rows = []
  columns = []
  d_right = []
  d_left = []
  diagonals = [d_right, d_left]
  keys = (1..n.pow(2)).to_a
  n.times do |i|
    rows << keys.select {|num| num if num > n * i && num <= n + (n * i)}
    columns << keys.select {|num| num if num % n == i}
    keys.each do |key|
      d_right << key if key == n * i + (i + 1)
      d_left << key if key == n * i + (n - i)
    end
  end
  [rows, columns, diagonals]
end

## game logic
def win?(brd, n)
  winner = false
  winning_lines(n).each do |line|
    line.each do |possible_win|
      if possible_win.all? {|key| brd[key] == PLAYER_MARKER}
        winner = "PLAYER"
      elsif possible_win.all? {|key| brd[key] == COMPUTER_MARKER}
        winner = "COMPUTER"
      end
    end
  end
  winner
end

## User input. First move sets initial position.
def user!(brd, n)
  choice = ""
  puts "Select a square."
  loop do
    choice = gets.chomp
    break if empty_spaces(brd, n).values.include?(choice)
    puts "Invalid choice. Valid choices are #{empty_spaces(brd, n).values.join(', ')}"
  end
  brd[choice.to_i] = PLAYER_MARKER
end

## Computer input
def computer!(brd, n)
  choices = Array.new
  best = minimax(brd, n, n.pow(2)-1, true, choices)
  puts "result of algorithm is #{best}"
  puts choices
  binding.pry
  best_options = choices.select {|choice| choice.keys[0] == best}
  if best_options.empty?
    brd[empty_spaces(brd, n).keys.sample] = COMPUTER_MARKER
    puts "Chose randomly"
  else
    pick = best_options.sample[best]
    brd.merge!(pick)
    puts "Chose with algorithm, best is #{best}"
  end
end

## Heuristic evaluation function, such that the result is equal to the
## number of x's possibility's to win less the number of o's possibility's to win
def heuristic(brd, n)
  player_possibilities = 0
  computer_possibilities = 0
  winning_lines(n).each do |line| 
    player_possibilities += line.count {|computer_moves| computer_moves.none? {|space| brd[space] == COMPUTER_MARKER}}
    computer_possibilities += line.count {|player_moves| player_moves.none? {|space| brd[space] == PLAYER_MARKER}}
  end
  computer_possibilities - player_possibilities
end

## Minimax
def  minimax(brd, n, depth,  maximizingPlayer, computers_choices)
  
  value = 0
  if depth == 0
    ##return the heuristic value of the node
  ##  puts "Evaluated node, value is #{heuristic(brd, n)} || #{empty_spaces(child, n)
    return heuristic(brd, n)
  end
  if maximizingPlayer
    value = -100
    child = brd.clone ## clone the game state then modify to change through the tree
    empty_spaces(child, n).each do |k, v|
      ## Mark the child to be evaluated
      child[k] = COMPUTER_MARKER
      ## Evaluate the child
      if win?(child, n)
        child[k] = v
        return value
      end
      value = [value, minimax(child, n, depth-1, false, computers_choices)].max
      ## Collect values of potential board states
      collect = child.clone
      computers_choices << {value => collect}
      ## Reset the board for next evaluation
      child[k] = v
    end
  else
    value = 100
    child = brd.clone
    empty_spaces(child, n).each do |k, v|
      child[k] = PLAYER_MARKER
      if win?(child, n)
        child[k] = v
        return value
      end
      value = [value, minimax(child, n, depth-1, true, computers_choices)].min
      collect = child.clone
      computers_choices << {value => collect}
      child[k] = v
    end
  end
  value
end

## Admin details
def tourney_length
  puts "How many games do you want to play?"
  length = gets.chomp.to_i
end

def board_size
  puts "What size board?"
  gets.chomp.to_i
end

def end_game(tracker)
  puts  "PLAYER: #{tracker.count("PLAYER")} | "+
        "COMPUTER: #{tracker.count("COMPUTER")} | "+
        "TIES: #{tracker.count("TIE")}\n"+
        "q to quit. Press any other key to continue."
  quit = gets.chomp
  quit.upcase == "Q" ? true : false
end

## Play game & return winner
def play(brd, n)
  loop do
    display(brd, n)
    user!(brd, n)
    computer!(brd, n)
    break if win?(brd, n) || full?(brd, n)
  end
  !!win?(brd,n) ? win?(brd,n) : "TIE"
end

## Tournament Loop
score = Array.new
tourney_length.times do
  size = board_size
  board = init_board(size)
  score << play(board, size)
  break if end_game(score)
end
