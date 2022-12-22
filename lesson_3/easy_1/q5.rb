# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

(10..100).cover?(42) # Returns true if obj is between the begin and end of the range.

(10..100).include?(42) # Returns true if obj is an element of the range, false otherwise.
