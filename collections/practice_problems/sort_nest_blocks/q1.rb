arr = ['10', '11', '9', '7', '8']
#sort by descending numeric value
#arr = arr.map do |num|
#  num.to_i
#end
puts arr.sort{|a,b| b.to_i<=>a.to_i}
