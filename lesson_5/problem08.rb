hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if char =~ /[aeiou]/
    end
  end
end
