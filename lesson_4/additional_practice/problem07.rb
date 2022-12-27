statement = "The Flintstones Rock"
frequency = Hash.new
statement.delete(' ').chars { |char| frequency[char] = statement.count(char) }

# Let's explore Launch School's solution

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

# ------------------------------------------------------------------------

# Input: String
# Output: Hash, keys as chars, values as frequency integer

# Examples
# sentence = 'Hello'
# frequency = { 'H'=>1, 'e'=>1, 'l'=>2, 'o'=> 1 }

# 1. Split the string into array ( #chars or #split(//) )
# 2. if not in hash then add to hash
# 3. if in hash then add count
# 4. Repeat steps 2-3
# 4. return hash

# def frequent(string)
#   new_hash = {}
#   chars = string.chars

#   chars.each do |char|
#     if new_hash.include?(char)
#       new_hash[char] += 1
#     else
#       new_hash[char] = 1
#     end
#   end

#   new_hash
# end

# sentence = 'Hello'
# frequency = { 'H'=>1, 'e'=>1, 'l'=>2, 'o'=> 1 }

# frequent(sentence) == frequency # => true

# Solution works
# Let's explore other solutions

# new_hash = Hash.new

# sentence.chars { |char| new_hash[char] = sentence.count(char) }
