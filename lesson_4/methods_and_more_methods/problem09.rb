{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear']

# map invokes the given block for each element of calling collection
# map creates a new array that contains values returned by the block

# in this code, map first creats a new array
# then starts with {a: 'ant'}, the if condition statement is false and will not execute
# if none of the if statement conditions evaluates as true, it returns nil
# and so for the first element in the array it will be nil
# => [nil]

# in the next iteration, we have {b: 'bear'}, the if condition statement is true because
# the length of value 'bear' is > 3. The if statement then executes, the last and only expression
# inside is value, which then gets returned so for the second element in the array, it will be 'bear'
# => [nil, 'bear']
