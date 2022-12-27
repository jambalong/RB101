hash = { a: 'ant', b: 'bear' }
hash.shift

# => [:a, 'ant']
# removes the first key-value pair from hash, and returns an array containing [key, value]

# hash = { b: 'bear' }
# hash is mutated in this process

# https://rubyapi.org/2.7/o/hash#method-i-shift for Hash#shift
