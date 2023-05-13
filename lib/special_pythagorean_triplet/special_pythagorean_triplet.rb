# frozen_string_literal: true

class SpecialPythagoreanTriplet
  class << self
    def product_of_a_triplet_which_the_sum_equals(sum)
      (1..sum).each do |a|
        (a + 1..sum).each do |b|
          c = sum - (a + b)
          return (a * b * c) if (a**2) + (b**2) == c**2
        end
      end
    end
  end
end
