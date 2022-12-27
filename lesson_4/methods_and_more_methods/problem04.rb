['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}

# When each_with_object is invoked, we pass in an object ( {} is this case ). This object is then passed into the
# block and its updated value is returned at the end of each iteration. When each_with_object is done iterating
# through the calling collection, it returns the initial passed object, which now includes all the values

# For this code, we start with a hash object {}. On the first iteration, we add 'a' => 'ant' to the hash.
# On the next iteration, we add 'b' => 'bear'. On the last iteration, we add 'c' => 'cat'. And so when
# each_with_object is done iterating over the calling collection, it returns the hash that contains these
# three elements
