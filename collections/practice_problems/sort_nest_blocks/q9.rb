arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
#return a new array of the same structure but with ordered sub arrays (descending)
print arr.map {|a| a.sort {|x,y| y<=>x}}
