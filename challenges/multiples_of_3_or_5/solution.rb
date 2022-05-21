sum = 0;

(3...1000).each do |current_number|
    sum += current_number if current_number % 3 == 0 || current_number % 5 == 0
end

puts "Answer: #{sum}"
