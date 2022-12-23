# both methods will return the same value, but the first method will return a reference to the object that is passed
# in as buffer argument, while the second will return a new object. The first method also mutates the buffer argument
# that is passed, while the second method will not mutate the input_array argument.

# and so if the first method is used, we will see the original array modified,
# while the second will not modify the original array

# the first method both returns a meaningful value and has the side effects to mutate the buffer passed in
# the second method will return a meaningful value and has no side effects
