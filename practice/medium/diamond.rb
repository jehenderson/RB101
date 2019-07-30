# Write a method that displays a 4-pointed diamond in an 
# n x n grid, where n is an odd integer that is supplied as 
# an argument to the method. You may assume that the argument 
# will always be an odd integer.

def diamond(size)
  stars = 1
  # top half
  loop do
    ((size/2 + 1) - stars).times { print " " }
    (stars*2 - 1).times { print "*" }
    puts ""
    break if stars >= size/2
    stars += 1
  end
  return if size == 1
  # middle
    size.times { print "*" }
    puts ""
  # bottom half
  loop do
    ((size/2 + 1) - stars).times { print " " }
    (stars*2 - 1).times { print "*" }
    puts ""
    break if stars == 1
    stars -= 1
  end
end

diamond(1)
diamond(3)
diamond(9)
diamond 21