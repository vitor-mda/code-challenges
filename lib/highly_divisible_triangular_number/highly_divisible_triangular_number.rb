# frozen_string_literal: true

class HighlyDivisibleTriangularNumber
  def self.first_with_over(divisors:) = new(divisors).find

  def initialize(divisors_count)
    @divisors_count = divisors_count
    @triangular_number_position = 1
    @triangular_number = 1
  end

  def find = first_triangular_number_over_the_divisors_count

  private

  def first_triangular_number_over_the_divisors_count
    loop do
      return @triangular_number if over_divisors_count?

      next_triangular_number
    end
  end

  def over_divisors_count? = divisors_count_for_current_number > @divisors_count

  def divisors_count_for_current_number = Divisors.for(number: @triangular_number).count

  def next_triangular_number = @triangular_number += (@triangular_number_position += 1)

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
