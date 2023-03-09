# frozen_string_literal: true

require 'prime'

class TenThousandFirstPrime
  class << self
    def fetch(nth_prime:)
      Prime.lazy.drop(nth_prime - 1).first
    end
  end
end
