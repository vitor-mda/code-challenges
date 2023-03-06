# frozen_string_literal: true

class SmallestMultiple
  class << self
    def divisible_by_each_number(from:, to:)
      (from..to).reduce(:lcm)
    end
  end
end
