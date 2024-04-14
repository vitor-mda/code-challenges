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

  def divisors_count_for(number) = Divisors.for(number:).count

  class Divisors
    def self.for(number:) = new(number)

    def initialize(number)
      @dividend = number
      @divisor_candidate = 2
      @count_by_divisor = Hash.new(1)
    end

    def count
      return 1 if @dividend == 1

      divisors_count
    end

    private

    def divisors_count
      until @dividend == 1
        next @divisor_candidate += 1 unless (@dividend % @divisor_candidate).zero?

        @dividend /= @divisor_candidate
        @count_by_divisor[@divisor_candidate] += 1
        @divisor_candidate = 2
      end

      @count_by_divisor.values.reduce(&:*)
    end
  end
  private_constant :Divisors
end
