# frozen_string_literal: true

class LargeSum
  def self.first_ten_digits_from_the_sum_of(numbers)
    numbers.sum.digits.reverse.take(10).join.to_i
  end
end
