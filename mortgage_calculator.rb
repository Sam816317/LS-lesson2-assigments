def prompt(message)
  puts "=> #{message}"
end

  
prompt("Welcome to Mortgage Calculator! Please enter your name:")

name = ''
loop do
  name = gets.chomp
  
  if name.empty?
    prompt("Make sure to use a valid name")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  
  loan_amount = nil
  loop do
    prompt("Please enter your loan amount:")
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_f <= 0
      prompt("Please enter a positive number: ")
    else
      break
    end
  end
  
  annual_percentage_rate = nil
  monthly_interest_rate = nil
  loop do
    prompt("Please enter your Annual Percentage Rate (APR):")
    prompt("(Example: 6 for 6% or 3.5 for 3.5%)")
    annual_percentage_rate = gets.chomp
    if annual_percentage_rate.empty? || annual_percentage_rate.to_f <= 0
      prompt("Please enter a positive number: ")
    else
      annual_percentage_rate = annual_percentage_rate.to_f / 100
      monthly_interest_rate = annual_percentage_rate / 12
      prompt("You monthly interest rate is #{monthly_interest_rate}.")
      break
    end
  end
  
  loan_duration_years = nil
  loan_duration_months = nil
  loop do 
    prompt("Please enter your loan duration in years:")
    loan_duration_years = gets.chomp
    if loan_duration_years.empty? || loan_duration_years.to_i <= 0
      prompt("Please enter a positive number:")
    else
      loan_duration_months = loan_duration_years.to_i * 12
      prompt("Your loan duration in months is #{loan_duration_months}")
      break
    end
  end
  
  monthly_payment = loan_amount.to_f * 
                    (monthly_interest_rate / 
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
  
  prompt("Your monthly payment is #{monthly_payment}.")
  
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  system('clear')
end


prompt("Thank you for using Mortgage Calculator!")
prompt("Good bye!")
    
  

