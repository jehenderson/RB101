incremeneted_hash = {}
arr = [{a: 1}, {b: 2, c: 3}, {d:4, e: 5, f: 6}].map do |hsh|
  hsh.each do |key, value|
    hsh[key] = value+=1
  end
end
print arr
