require 'yaml'

LANGUAGE = 'en'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang = LANGUAGE)
  MESSAGES[lang][message]
end

# Display message with prompt =>
def prompt(message)
  puts "=> #{message}"
end

# Validate number is integer or float
def number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

# Adding to operator an '-ing'
def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt messages('welcome')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt 'valid_name'
  else
    break
  end
end

prompt format(messages('greet'), name: name)

loop do # main loop
  number1 = ''
  loop do
    prompt messages('first_number')
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt messages('not_valid')
    end
  end

  number2 = ''
  loop do
    prompt messages('second_number')
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt messages('not_valid')
    end
  end

  prompt messages('operator_prompt')

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt messages('valid_op')
    end
  end

  prompt format(messages('op_calculate'), op_message: operation_to_message(operator))

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt format(messages('result'), result: result)

  prompt messages('ask_again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt messages('goodbye')
