ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237 }
ages.values.sum # => 6174

# Input: hash with name as key, age as values
# Output: Integer which sums all the ages

# Examples:
# age_years = { 'John' => 25, 'Bob' => 21, 'Sam' => 24 }
# => 70

# 1. Grab the values
# 2. Sum all the values
# 3. Return the sum

# def sum_ages(hash)
#   hash.values.sum
# end

# age_years = { 'John' => 25, 'Bob' => 21, 'Sam' => 24 }

# p sum_ages(age_years) == 70 # => true
