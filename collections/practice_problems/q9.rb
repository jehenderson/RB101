words = "the flintstones rock"
def titleize(str)
  words = str.split(" ")
  words.each_index {|index| words[index].capitalize!}
  words.join(" ")
end
puts titleize(words)
