# PEDAC - Problem, Examples (test cases), data structure, algorithm, code
require "pry"
def reverse_sentence(str)
    str.split.reverse.join(' ')
end

def reverse_words(str)
    words = str.split
    words.each do |word|
        word.reverse! if word.length > 4
    end
    str = words.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')