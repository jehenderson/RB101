flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each_with_index do |name, index|
  if name[0..1] == "Be"
    puts index
  end
end
