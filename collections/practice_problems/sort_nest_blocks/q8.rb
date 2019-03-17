hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each_value do |value|
  value.each do |word|
    puts word[/?<vowel>/]
  end
end
