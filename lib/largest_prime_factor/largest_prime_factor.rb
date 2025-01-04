# frozen_string_literal: true

class LargestPrimeFactor
  class << self
    def of(number) = new(number).find
  end

  def initialize(number)
    @number = number
    @largest_prime_factor = 2
    @largest_prime_factor_candidate = 2
  end

  def find
    calculate_largest_prime_factor
    @largest_prime_factor
  end

  private

  def calculate_largest_prime_factor
    while candidate_below_number?
      promote_candidate && reduce_number if candidate_is_a_factor?
      next_candidate
    end
  end

  def candidate_below_number? = @largest_prime_factor_candidate <= @number
  def candidate_is_a_factor?  = (@number % @largest_prime_factor_candidate).zero?
  def promote_candidate       = @largest_prime_factor = @largest_prime_factor_candidate
  def reduce_number           = (@number /= @largest_prime_factor_candidate while candidate_is_a_factor?)
  def next_candidate          = @largest_prime_factor_candidate += 1
end
