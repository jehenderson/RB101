arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr.each do |a|
  a.sort! do |x, y|
    x if x.odd? <=> y if y.odd?
  end
end
print arr
