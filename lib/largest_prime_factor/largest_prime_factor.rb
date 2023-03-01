# frozen_string_literal: true

require 'prime'

class LargestPrimeFactor
  class << self
    def of(number)
      Prime.prime_division(number).max.first
    end
  end
end
