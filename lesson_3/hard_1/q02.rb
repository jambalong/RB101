#=> {:a=>"hi there"}

# informal_greeting is pointing to the same object as 
greetings[:a]

# note: greetings is an object (a hash) that has another object 
greetings[:a] # (a symbol) whose value is "hi" (a string)

# greetings.object_id => 240
# greetings[:a].object_id => 260
# informal_greeting.object_id => 260

informal_greeting << ' there' 
# mutates the object that called it, thereby modifying greetings[:a] as well

=begin
------------
If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:

we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone.
we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object."
=end
