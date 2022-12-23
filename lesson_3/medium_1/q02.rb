# There was an error due to concantenation between a string and an integer, and there was no implicit conversion done

puts "the value of 40 + 2 is " + (40 + 2).to_s # converting the integer to string
puts "the value of 40 + 2 is #{40 + 2}" # string interpolation
