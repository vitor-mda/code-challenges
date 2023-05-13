# frozen_string_literal: true

require 'prime'

class SummationOfPrimes
  class << self
    def sum_of_all_primes_below(upper_bound)
      exclusive_upper_bound = upper_bound - 1
      Prime.each(exclusive_upper_bound).sum
    end
  end
end
