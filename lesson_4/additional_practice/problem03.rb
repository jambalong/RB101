ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }
ages.delete_if {|_, value| value >= 100}

# ages.keep_if { |_, age| age < 100 }
# I could also use #select!

# Input: hash, name as key, age as value
# Output: hash, remove people with age above a certain number

# Examples:
# age_years = { 'John' => 25, 'Bob' => 21, 'Sam' => 24 }
# under_25 = { 'Bob' => 21, 'Sam' => 24 }

# 1. Iterate each pair
# 2. Check values if under 25
# 3. Delete pair / Remove pair
# 4. Return hash with removed pair

# def remove_above_25(hash)
#   removed_under_25 = {}

#   hash.each do |key, value|
#     removed_under_25[key] = value if value < 25
#   end

#   removed_under_25
# end

# age_years = { 'John' => 25, 'Bob' => 21, 'Sam' => 24 }
# under_25 = { 'Bob' => 21, 'Sam' => 24 }

# remove_above_25(age_years) == under_25 # => true

# I could also explore using Hash#delete_if
