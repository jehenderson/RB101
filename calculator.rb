def calculator(x,y,operation)
  if x.to_i.integer?
    x = x.to_i
  else
    "Please input a valid integer for x"
  end
  if y.to_i.integer?
    y = y.to_i
  else
    "Please input a valid integer for y"
  end
  if operation == "+"
    "The answer is #{x+y}!"
  elsif operation == "-"
    "The answer is #{x-y}!"
  elsif operation == "*"
    "The answer is #{x*y}!"
  elsif operation == "/"
    "The answer is #{x/y}!"
  else
    "Please input a valid operator. Choices are '+,-,* or /"
  end
end

puts "I am your calculator! Please give me two integers, and then tell me which operation you would like performed (+,-,* or /)"
x = gets().chomp()
y = gets().chomp()
operation = gets().chomp()

puts calculator(x,y,operation)
