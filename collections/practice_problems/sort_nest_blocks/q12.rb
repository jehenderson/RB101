arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
#return hash where key is first element and values follow, do not use to_h
hsh = {}
arr.each do |a|
  hsh[a[0]] = a[1]
end
print hsh
