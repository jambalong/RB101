def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# the purpose of number % divisor == 0, is to find the divisors that will not leave any remainders

# the purpose of line 8 in the method is to return our array of factors from the method. if we didn't implicitly
# return factors, we will instead return the last statement executed and the value is nil
