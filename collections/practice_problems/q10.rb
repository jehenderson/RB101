munsters = {
  "Herman" => {"age" => 32, "gender" => "male"},
  "Lily" => {"age" => 30, "gender" => "female"},
  "Grandpa" => {"age" => 402, "gender" => "male"},
  "Eddie" => {"age" => 10, "gender" => "male"},
  "Marilyn" => {"age" => 23, "gender" => "female"}
}
#add age group key | 0-17 => kid, 18-64 => adult, 65+ => senior
munsters.each do |key, value|
  value.merge!("age_group" => "kid") if value["age"]<18
  value.merge!("age_group" => "adult") if value["age"]>17 && value["age"]<65
  value.merge!("age_group" => "senior") if value["age"]>64
  puts "The key is #{key} and the value is #{value}"
end
