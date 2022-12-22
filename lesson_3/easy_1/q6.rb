# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

"Four score and " + famous_words # Concatenation

"Four score and " << famous_words # Concatenation

famous_words.insert(0, 'Four score and ') # Inserts other_str before the character at the given index, modifying str.

famous_words.prepend('Four score and ') # Prepend the given strings to str.
