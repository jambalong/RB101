# limit is initialized outside the method and therefore the method fib is not able to access 
# the variable called limit within the scope of the method

def fib(first_num, second_num)
  limit = 15 # initialize a limit inside the method
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# or have the limit passed in as an argument to the method

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"
