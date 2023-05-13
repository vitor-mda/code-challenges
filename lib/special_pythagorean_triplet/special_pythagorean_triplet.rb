# frozen_string_literal: true

class SpecialPythagoreanTriplet
  class << self
    def product_of_a_triplet_which_the_sum_equals(sum)
      (1..sum).each do |a|
        (a + 1..sum).each do |b|
          (b + 1..sum).each do |c|
            return (a * b * c) if a + b + c == sum && (a**2) + (b**2) == c**2
          end
        end
      end
    end
  end
end
