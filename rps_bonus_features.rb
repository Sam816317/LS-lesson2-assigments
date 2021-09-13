WINNING_MOVES = { "rock" => ['scissors', 'lizard'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'spock' => ['scissors', 'rock'],
                  'lizard' => ['spock', 'paper'] }
MAX_WINS = 3

def prompt(message)
  puts("=> #{message}")
end

def get_player_choice
  loop do
    prompt("Enter 'r' for rock, 'p' for paper, 'sc' for scissors,
    'sp' for spock, 'l' for lizard (You can also enter the full word)")
    input = gets.chomp
    choice = convert_input(input)

    if WINNING_MOVES.keys.include?(choice)
      return choice
    else
      prompt("That's not a valid choice.")
    end
  end
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

def convert_input(input)
  input = input.downcase
  case
  when input == 'r' || input == 'rock'
    'rock'
  when input == 'p' || input == 'paper'
    'paper'
  when input == 'sc' || input == 'scissors'
    'scissors'
  when input == 'sp' || input == 'spock'
    'spock'
  when input == 'l' || input == 'lizard'
    'lizard'
  else
    'invalid_choice'
  end
end

def display_end_of_round_message(player_win_count, computer_win_count)
  prompt("Score: You - #{player_win_count}, Computer - #{computer_win_count}")
  puts "\n"
  if player_win_count < MAX_WINS && computer_win_count < MAX_WINS
    prompt("Let's play again!")
  elsif player_win_count == MAX_WINS
    prompt("You are the grand winner!")
  elsif computer_win_count == MAX_WINS
    prompt("The computer is the grand winner :(")
  end
end

def update_player_score(player_win_count, choice, computer_choice)
  if WINNING_MOVES[choice].include?(computer_choice)
    player_win_count += 1
  else
    player_win_count
  end
end

def update_computer_score(computer_win_count, choice, computer_choice)
  if WINNING_MOVES[computer_choice].include?(choice)
    computer_win_count += 1
  else
    computer_win_count
  end
end

player_win_count = 0
computer_win_count = 0
choice = ''
prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard!")
puts "\n"
prompt("The rules are as follows: ")
puts "\n"
prompt("Scissors cuts paper and decapitates lizard")
prompt("Paper covers rock and disproves Spock.")
prompt("Rock crushes scissors and crushes lizard.")
prompt("Spock smashes scissors and vaporizes rock.")
prompt("And lizard poisons Spock and eats paper.")
puts "\n"
prompt("First to 3 wins is the grand winner.")
puts "\n"
prompt("Press 'enter' when you are ready to play!")
gets.chomp

system('clear')

loop do
  choice = get_player_choice
  computer_choice = WINNING_MOVES.keys.sample

  puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  player_win_count = update_player_score(player_win_count, choice, computer_choice)
  computer_win_count = update_computer_score(computer_win_count, choice, computer_choice)

  display_end_of_round_message(player_win_count, computer_win_count)

  if player_win_count < MAX_WINS && computer_win_count < MAX_WINS
    prompt("Press 'enter' to start the next round:")
    gets.chomp
    system('clear')
  end

  if player_win_count == MAX_WINS || computer_win_count == MAX_WINS
    prompt("Do you want to play again?")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
    player_win_count = 0
    computer_win_count = 0
    system('clear')
  end
end

prompt("Thank you for playing! Good bye!")
