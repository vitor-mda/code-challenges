# frozen_string_literal: true

class SumSquareDifference
  class << self
    def of_the_numbers_between(number:, and_number:)
      (number..and_number)
        .then { square_of_the_sum_of(it) - sum_of_the_squares_in(it) }
    end

    private

    def square_of_the_sum_of(range)
      range.sum.abs2
    end

    def sum_of_the_squares_in(range)
      range.sum(&:abs2)
    end
  end
end
