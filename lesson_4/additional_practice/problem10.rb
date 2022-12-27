munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

munsters.each do |name, details|
  if details['age'].between?(0, 17)
    details['age_group'] = 'kid'
  elsif details['age'].between?(18, 64)
    details['age_group'] = 'adult'
  else
    details['age_group'] = 'senior'
  end
end

# Solution using case statement instead of if/else statement (less clutter)

munsters.each do |name, details|
  case details['age']
  when 0...18
    details["age_group"] = "kid"
  when 18...64
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

# Input: Hash, names as keys, hash with age and gender as values
# Output: Add additional 'age_group' => (kid, adult, or senior) key-value in value hash

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# Examples:
# munsters = {
#   'Herman' => { 'age' => 32, 'gender' => 'male' },
#   'Lily' => { 'age' => 30, 'gender' => 'female' },
#   'Grandpa' => { 'age' => 402, 'gender' => 'male' },
#   'Eddie' => { 'age' => 10, 'gender' => 'male' },
#   'Marilyn' => { 'age' => 23, 'gender' => 'female' }
# }

# munsters_additional = {
#   "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
# }

# 1. Access the hash values
# 2. Check the age value to see which age_group it belongs to
# 3. Append age_group with proper age group as value
# 4. Repeat steps 2-3 until max size
# 5. Return the entire hash

# def add_age_group(munsters)
#   munsters.map do |name, hash|
#     if hash['age'].between?(0, 17)
#       hash['age_group'] = 'kid'
#     elsif hash['age'].between?(18, 64)
#       hash['age_group'] = 'adult'
#     else
#       hash['age_group'] = 'senior'
#     end
#   end
#   munsters
# end

# p add_age_group(munsters) == munsters_additional # => true

# Solution works
