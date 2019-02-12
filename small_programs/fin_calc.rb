def calc(principal, rate, duration)
  j = rate / 12
  t = duration * 12
  principal * (j / (1 - (1 + j)**(-t)))
end

calc_prompt = <<-FOO
  I'm your mortgage calculator! 
  Please enter the loan amount (in dollars),
  interest rate (APR), and loan duration (in years).
  FOO

response = ""
until response == "exit"
  puts calc_prompt
  principal = gets.chomp.to_i
  rate = gets.chomp.to_f
  duration = gets.chomp.to_i
  output = <<-OUT
  With a loan principal of $#{principal}, an APR of #{(rate*100).to_i}%, & a term of #{duration} years,
  your monthly payments will be: $#{calc(principal, rate, duration).to_i}
  OUT
  puts output
  puts "Type exit to end."  
  response = gets.chomp.downcase
end
