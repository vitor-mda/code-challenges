# frozen_string_literal: true

class SmallestMultiple
  class << self
    # 💩 atrocious performance, as expected from a brute force approach
    def divisible_by_each_number(from:, to:)
      divisors = (from..to)

      (2..).step(2).find do |number|
        divisors.all? { |divisor| (number % divisor).zero? }
      end
    end
  end
end
