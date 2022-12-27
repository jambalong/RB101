words = "the flintstones rock"
words = words.split.map { |word| word.capitalize }.join(' ')

# Let's make it into a method

def titleize(string)
  string.split.map { |word| word.capitalize! }.join(' ')
end

sentence = "titleize this sentence"
titleize(sentence) # => "Titleize This Sentence"
