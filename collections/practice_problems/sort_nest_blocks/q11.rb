arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr2 = arr.map do |a|
  a.select {|num| num%3==0}
end
print arr2
