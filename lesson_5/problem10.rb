[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  new_hash = {}
  hash.each { |key, value| new_hash[key] = value + 1 }
  new_hash
end

# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
