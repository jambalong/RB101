['ant', 'bear', 'caterpillar'].pop.size

# => 11

# from the calling array, pop is invoked which destructively removes the last element in the array
# and returns that element pop returns the string 'caterpillar' and we chain size method to it
# size then returns an integer indicating the character length of the string 'caterpillar'
