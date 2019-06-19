def stringy(num)
  stringy = ""
  bit = '1'
  num.times do 
    stringy = stringy + bit
    bit = flip(bit)
  end
  stringy
end

def flip(bit)
  bit == '0' ? '1' : '0'
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'