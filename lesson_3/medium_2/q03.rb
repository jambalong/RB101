def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" #=> "pumpkins"
puts "My array looks like this now: #{my_array}" #=> ["pumpkins", "rutabaga"]

# the string does get concatenated with "rutabaga" inside the method
# however, since it's an assignment operator +=, the string is not mutated (a new string object is created)
# my_string will not be modified and still be "pumpkins"

# on the other hand, my_array is concatenated using <<, inside the method
# this mutates the array and will return ["pumpkins", "rutabaga"]
# modifying the array outside the method
