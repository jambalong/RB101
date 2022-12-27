[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# any? passes each element to the block

# block's return value is true if the element in the collection is odd, false if even as it iterates
# This is determined by the last expression in the block, num.odd? 's return which will be boolean

# any? return value is true, since it returns true if the block ever returns a value other than false or nil

# NOTE: any? stops iterating after the first iteration that the block returned true, since there is no need
# to evaluate the remaining items in the arry

# puts num is only ever executed for the first item in the array: 1
