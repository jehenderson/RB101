my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(data, multiplier)
  i = 0
  for num in data
    data[i] = num*multiplier
    i+=1
  end
  data
end

print my_numbers
multiply(my_numbers, 3)
print my_numbers
