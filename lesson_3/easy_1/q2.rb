# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# both have many meanings depending on the situation and they could also be part of method names
# ! at the end of methods usually means destructive
# ? at the end of methods usually means it will return either true or false
# ? is also seen in ternary operators as ?:

# 1. what is != and where should you use it?

# != is NOT equals (inequality), used in conditionals


# 2. put ! before something, like !user_name

!user_name 
# makes this object into a boolean and reverses it (true to false, false to true)


# 3. put ! after something, like words.uniq!

# most methods called that have ! at the end can be considered destructive or could mutate the caller


# 4.  put ? before something

# ?something doesn't really have any meaning, but as ternary operator it works like this:
condition ? 'returns if true' : 'returns if false'


# 5.  put ? after something

something?()
# is usually a method name, expected to return either true or false but not required.


# 6.  put !! before something, like !!user_name

!!user_name 
# makes this object into a boolean of itself (true to false to true, false to true to false)
