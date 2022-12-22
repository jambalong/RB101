# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

statement.count('t')

# Each other_str parameter defines a set of characters to count. The intersection of these sets defines the characters to count in str. Any other_str that starts with a caret ^ is negated. The sequence c1-c2 means all characters between c1 and c2. The backslash character \ can be used to escape ^ or - and is otherwise ignored unless it appears at the end of a sequence or the end of a other_str.

# Examples:
a = "hello world"
a.count "lo"                   #=> 5
a.count "lo", "o"              #=> 2
a.count "hello", "^l"          #=> 4
a.count "ej-m"                 #=> 4

"hello^world".count "\\^aeiou" #=> 4
"hello-world".count "a\\-eo"   #=> 4

c = "hello world\\r\\n"
c.count "\\"                   #=> 2
c.count "\\A"                  #=> 0
c.count "X-\\w"                #=> 3
