VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]
user_response, computer_response = [], []
wins, losses, ties = 0, 0, 0
score = [wins, losses, ties]
results = [user_response, computer_response]

def win?(user1, user2)
  if (user1 == "rock" && user2 == "scissors") ||
      (user1 == "rock" && user2 == "lizard") ||
      (user1 == "paper" && user2 == "rock") ||
      (user1 == "paper" && user2 == "spock") ||
      (user1 == "scissors" && user2 == "paper") ||
      (user1 == "scissors" && user2 == "lizard") ||
      (user1 == "lizard" && user2 == "paper") ||
      (user1 == "lizard" && user2 == "spock")
        true
  end
end

def get_choice
  choice = ''
  loop do
    puts "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = Kernel.gets.chomp
    break if VALID_CHOICES.include?(choice)
    puts "Please enter a valid choice. Valid choices are #{VALID_CHOICES.join(', ')}"
  end
  choice
end  

counter = 0
loop do
  user_response << get_choice
  computer_response << VALID_CHOICES.sample
  puts "You chose #{user_response[counter]}, computer chose #{computer_response[counter]}:"
  if win?(user_response[counter], computer_response[counter])
    score[0] += 1
    puts "You won!"
  elsif win?(computer_response[counter], user_response[counter])
    score[1] += 1
    puts "You lost!"
  else
    score[2] += 1
    puts "You tied!"
  end
  counter += 1
  puts "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
puts "Your score was #{score[0]} wins, #{score[1]} losses, & #{score[2]} ties."
