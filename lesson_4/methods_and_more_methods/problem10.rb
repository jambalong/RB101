[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]

# Similar case with Practice Problem 9.

# when we iterate over 1, the if statement evaluates false, and else statement is evaluated
# num is returned by the block which is 1

# when we iterate over 2 and 3, the if statement evaluates true, which then evaluates puts num
# nil is returned by the block
