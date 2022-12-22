# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?('Dino') # => false, but it can find any substring with 'dino'
advice.match?('Dino') # => false, but it can find any substring with 'dino'
