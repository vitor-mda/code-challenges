# frozen_string_literal: true

class FactorialDigitSum
  def self.of_the_number(number)
    number
      .downto(1)
      .reduce(&:*)
      .digits
      .sum
  end
end
