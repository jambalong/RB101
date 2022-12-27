flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index {|name| name.start_with?('Be')}
# Another block we could use is String#[], which is { |name| name[0, 2] == 'Be'}


# Input: Array of strings
# Output: Integer, index of first_name starts with a certain string

# Examples
# names = %w(John Bob Sam)
# => 2

# Test:
# names = %w(John Bob Sam)

# index_of_name = nil
# names.each_with_index do |name, index|
#   if name.start_with?('Sa')
#     index_of_name = index
#   end
# end

# index_of_name == 2 # => true

# Solution works
# Let's explore docs to see if there's a method that finds index
# https://rubyapi.org/2.7/o/array#method-i-find_index Array#find_index; aliases: #index
