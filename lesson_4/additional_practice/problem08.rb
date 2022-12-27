# What happens when we modify an array while we are iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# When we modify an array while interating over it, we risk skipping an element to iterate over since it's
# no longer in the array. This code will output:
# 1
# 3
# => [3, 4]

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# This code will output:
# 1
# 2
# => [1, 2]

# To better understand what is happening here, we augment our loop with some additional "debugging" information:
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# Output:
"0  [1, 2, 3, 4]  1"
"1  [2, 3, 4]  3"

# "From this we see that our array is being changed as we go (shortened and shifted), and the loop counter used by #each is compared against the current length of the array rather than its original length."

# "In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time."
