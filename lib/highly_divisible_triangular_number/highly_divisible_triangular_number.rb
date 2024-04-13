# frozen_string_literal: true

class HighlyDivisibleTriangularNumber
  def self.first_with_over(divisors:) = new(divisors).find

  def initialize(divisors) = @divisors = divisors

  def find = first_triangular_number_with_over_n_divisors

  private

  def first_triangular_number_with_over_n_divisors
    nth_triangular_number = 1
    last_triangular_number = 1
    loop do
      return last_triangular_number if over_n_divisors?(last_triangular_number)

      last_triangular_number += (nth_triangular_number += 1)
    end
  end

  def over_n_divisors?(number) = divisors_count_for(number) > @divisors

  def divisors_count_for(number)
    count = (number == 1 ? 1 : 2)

    divisor_candidate = 2
    max_divisor_candidate = number.ceildiv(2)
    while divisor_candidate <= max_divisor_candidate
      count += 1 if (number % divisor_candidate).zero?
      divisor_candidate += 1
    end

    count
  end
end
