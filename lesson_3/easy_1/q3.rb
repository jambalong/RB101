# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# best practice
advice.gsub!('imporatant', 'urgent')

# just another way
advice = advice.split
advice[6] = 'urgent'
advice = advice.join(' ')

puts advice
