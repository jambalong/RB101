flintstones = ['Fred', 'Barney', 'WIlma', 'Betty', 'Pebbles', 'BamBam']

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

# Input: array of strings
# Output: hash with names as key, and positions in the array as values

# Examples:
# arr = ['John', 'Bob', 'Sam']
# hsh = {'John' => 0, 'Bob' => 1, 'Sam' => 2}

# def array_to_hash_with_positions(array)
#   new_hash = {}

#   array.each_with_index do |name, index|
#     new_hash[name] = index
#   end

#   new_hash
# end

# arr = ['John', 'Bob', 'Sam']
# hsh = {'John' => 0, 'Bob' => 1, 'Sam' => 2}

# p array_to_hash_with_positions(arr) == hsh # => true
