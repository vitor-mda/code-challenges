sum = 0
previous_terms = [1, 2]

while previous_terms[1] < 4000000
    sum += previous_terms[1] if previous_terms[1] % 2 == 0
    previous_terms = [previous_terms[1], previous_terms.reduce(:+)]
end

puts "Answer: #{sum}"
