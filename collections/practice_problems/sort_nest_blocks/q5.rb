munsters = {
  "Herman" => {"age" => 32, "gender" => "male"},
  "Lily" => {"age" => 30, "gender" => "female"},
  "Grandpa" => {"age" => 402, "gender" => "male"},
  "Eddie" => {"age" => 10, "gender" => "male"},
  "Marilyn" => {"age" => 23, "gender" =>  "female"}
}
#figure total age of the male family members
total_age = 0
munsters.each_value do  |data|
  total_age += data["age"] if data["gender"] == "male"
end
puts total_age
