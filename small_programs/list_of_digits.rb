def digits_list(num)
  str_num = num.to_s
  str_num.each_char.to_a.map {|char| char.to_i}
end

puts digits_list(12345)
