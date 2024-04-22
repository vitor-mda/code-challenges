# frozen_string_literal: true

class PowerDigitSum
  def self.of_the_number(number, to_the_power_of:)
    (number**to_the_power_of)
      .digits
      .sum
  end
end
