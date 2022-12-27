flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name.byteslice(0, 3) }

# Another simpler method for the block is actually String#[], which is name[0, 3]
