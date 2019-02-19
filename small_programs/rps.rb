CHOICES = ["rock", "paper", "scissors"]

def prompt(message)
  Kernel.puts("=> #{message}")
end

def play(choice, computer_choice)
  loop do
    prompt("Choose one: #{CHOICES.join(', ')}")
    choice = Kernel.gets.chomp

    if CHOICES.include?(choice)
      break
    else
      puts "That's not a valid choice."
    end
  end

  Kernel.puts("You chose #{choice}, computer chose #{computer_choice}")

  if (choice == "rock" && computer_choice == "scissors") ||
      (choice == "paper" && computer_choice == "rock") ||
      (choice == "scissors" && computer_choice == "paper")
    prompt("You won!")
  elsif (choice == "rock" && computer_choice == "paper")
         (choice == "paper" && computer_choice == "scissors")
         (choice == "scissors" && computer_choice == "rock")
    prompt("You lost!")
  else
    prompt("You tied!")
  end
end

choice = ''
computer_choice = CHOICES.sample

loop do
  play(choice, computer_choice)
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
