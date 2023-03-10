# frozen_string_literal: true

require 'prime'

class TenThousandFirstPrime
  class << self
    def fetch(nth_prime:)
      Prime.take(nth_prime).last
    end
  end
end
