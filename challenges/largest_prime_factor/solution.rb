product = 600851475143
largest_prime_factor = nil

for smaller_factor in 2...(product / 2)
    is_prime = true
    if product % smaller_factor == 0
        larger_factor = product / smaller_factor
        larger_factor_half = larger_factor / 2

        for divisor in 2...larger_factor_half
            if larger_factor % divisor == 0
                is_prime = false
                break
            end
        end
        if is_prime
            largest_prime_factor = larger_factor 
            break
        end
    end
end

puts "Answer: #{largest_prime_factor}"
