# Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make the return value 
# "Few things in life are as important as ".
# But leave the advice variable as "house training your pet dinosaur.".

advice.slice!(0..38)
advice.slice!(0, 39)

advice.slice!(0, advice.index('house'))  # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."

# As a bonus, what happens if you use the String#slice method instead?

advice.slice(0, advice.index('house')) # => "Few things in life are as important as "

# It will not mutate advice

=begin
Bonus: Using slice, the non-destructive version of slice!, would return a new string with the same text 
("Few things in life are as important as ") but the advice variable would remain the same, pointing to the original string 
("Few things in life are as important as house training your pet dinosaur.").
=end
