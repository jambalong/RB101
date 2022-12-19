=begin
Loan Calculator formula:

m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months
=end

# Outputs message with => prompt
def prompt(message)
  puts "=> #{message}"
end

# Get the loan amount from user.
def loan_amount
  loop do
    prompt "What is your loan amount in dollars?"
    loan_amount = gets.chomp
    return loan_amount.to_f if valid_amount?(loan_amount)
    prompt "Please enter a valid amount"
  end
end

# Get the loan duration in years from user.
def loan_duration_in_years
  loop do
    prompt "What is the duration of your loan (in years)?"
    loan_duration = gets.chomp
    return loan_duration.to_f if valid_duration?(loan_duration)
    prompt "Please enter a valid duration"
  end
end

# Get the loan APR from user.
def loan_apr
  loop do
    prompt "What is your Loan APR? (e.g., enter 0.06 if 6%)"
    loan_apr = gets.chomp
    return loan_apr.to_f if valid_apr?(loan_apr)
    prompt "Please enter a valid APR"
  end
end

# Validates loan amount
def valid_amount?(amt)
  number?(amt) && amt.to_f.positive?
end

# Validates loan duration
def valid_duration?(dur)
  number?(dur) && dur.to_f.positive?
end

# Validates loantAPR
def valid_apr?(apr)
  number?(apr) && apr.to_f.positive? && apr.to_f <= 1.00
end

# Validates if a number
def number?(num)
  integer?(num) || float?(num)
end

# Validates if an integer
def integer?(num)
  num.to_i.to_s == num
end

# Validates if a float
def float?(num)
  num.to_f.to_s == num
end

# Prompt the user for a name
prompt "Welcome to the Loan Calculator! Please enter your name:"
name = gets.chomp

# Main loop
loop do
  prompt "Hello #{name}. I need three pieces of information. \n\n"
  sleep(0.7)

  # Call the methods to get loan amount, duration, and interest from user.
  amount = loan_amount
  duration_in_years = loan_duration_in_years
  apr = loan_apr

  interest = (apr / 12.0) # APR to Monthly Interest
  duration = (duration_in_years * 12.0) # Duration - Years to Months

  # Loan Formula
  payment = amount * (interest / (1 - (1 + interest)**(-duration)))

  prompt "Calculating the results... \n\n"
  sleep(2)

  # Display the results to the user, along with details.
  results = <<-MSG
  Here are your results:

    Loan Amount:    $#{format('%.2f', amount)}
    Loan Duration:  #{format('%d', duration)} months
    Loan APR:       #{format('%g', apr * 100)}%

  Your monthly payment will be: $#{format('%.2f', payment)}

  MSG

  prompt(results)

  prompt "Would you like to do another calculation? (Enter Y)"
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end
prompt "Thank you for using the loan calculator! Good bye!"
