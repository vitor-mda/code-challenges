# frozen_string_literal: true

class CountingSundays
  def self.on_the_first_of_the_month(during:)
    sundays = 0

    during.each { |date| sundays += 1 if date.sunday? && date.day == 1 }

    sundays
  end
end
