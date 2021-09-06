VALID_CHOICES = %w(rock paper scissors spock lizard)
WINNING_MOVES = { "rock" => ['scissors', 'lizard'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'spock' => ['scissors', 'rock'],
                  'lizard' => ['spock', 'paper'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  if WINNING_MOVES[player].include?(computer)
    prompt("You won!")
  elsif WINNING_MOVES[computer].include?(player)
    prompt("Computer won!")
  else
    prompt("It's a tie.")
  end
end

def expand_abbreviation(choice_abbreviation)
  case choice_abbreviation
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'sp'
    'spock'
  when 'l'
    'lizard'
  else
    'invalid_choice'
  end
end

def display_end_of_round_message(user_win_count, computer_win_count)
  prompt("Score: You - #{user_win_count}, Computer - #{computer_win_count}")
  if user_win_count < 3 && computer_win_count < 3
    prompt("Let's play again:")
  elsif user_win_count == 3
    prompt("You are the grand winner!")
  elsif computer_win_count == 3
    prompt("The computer is the grand winner :(")
  end
end

user_win_count = 0
computer_win_count = 0
choice = ''
prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard!")
prompt("First to 3 wins is the grand winner. Let's play!")
loop do
  loop do
    prompt("Enter 'r' for rock, 'p' for paper, 'sc' for scissors,
    'sp' for spock, 'l' for lizard:")
    choice_abbreviation = Kernel.gets().chomp()
    choice = expand_abbreviation(choice_abbreviation)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if WINNING_MOVES[choice].include?(computer_choice)
    user_win_count += 1
  elsif WINNING_MOVES[computer_choice].include?(choice)
    computer_win_count += 1
  end

  display_end_of_round_message(user_win_count, computer_win_count)
  break if user_win_count == 3 || computer_win_count == 3
end

prompt("Thank you for playing! Good bye!")
