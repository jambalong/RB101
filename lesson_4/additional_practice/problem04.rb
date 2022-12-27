ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237}
ages.values.min

# Input: hash, key is name, value is age
# Output: Integer that is the minimum age

# Examples:
# age_years = { 'John' => 25, 'Bob' => 21, 'Sam' => 24 }
# => 21

# 1. Grab the values
# 2. Check which is lower
# 3. Store that value
# 4. Repeat 2-3
# 5. Return the stored value

# def minimum_age(hash)
#   ages = hash.values
#   min_age = ages[0]

#   ages.each do |age|
#     min_age = age if age < min_age
#   end

#   min_age
# end

# age_years = { 'John' => 25, 'Bob' => 21, 'Sam' => 24 }

# minimum_age(age_years) == 21 # => true

# ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237}

# minimum_age(ages) # => 10

# Solution works, but let's try to check docs if there is a method that gives the minimum number in an array
# https://rubyapi.org/2.7/o/array#method-i-min Array#min
