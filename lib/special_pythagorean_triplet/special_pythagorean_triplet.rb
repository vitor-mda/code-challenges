# frozen_string_literal: true

class SpecialPythagoreanTriplet
  class << self
    def product_of_a_triplet_which_the_sum_equals(sum)
      upper_bound = sum / 2

      (1..).each do |a|
        (a + 1..upper_bound).each do |b|
          c = sum - (a + b)
          return (a * b * c) if (a**2) + (b**2) == c**2
        end
      end
    end
  end
end
