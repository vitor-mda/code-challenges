# frozen_string_literal: true

class NumberLetterCounts
  def self.from(from, to:) = new(from:, to:).count

  def initialize(from:, to:)
    @from = from
    @to = to
  end

  def count
    numbers_to_count.reduce(0) { |count, number| count + letter_count_for(number) }
  end

  private

  def numbers_to_count = @from..@to

  def letter_count_for(number)
    return count_under_hundreds_for(number) if number < 100

    over_three_digits_count_for(number)
  end

  def count_under_hundreds_for(number)
    return count_under_twenties_for(number) if number < 20

    number.digits.then do |ones, tens|
      COUNT_BY_TENS[tens] +
        COUNT_BY_UNIQUELY_NAMED_NUMBER.fetch(ones, 0)
    end
  end

  def count_under_twenties_for(number)
    COUNT_BY_UNIQUELY_NAMED_NUMBER[number]
  end

  def over_three_digits_count_for(number)
    return :onethousand.length if number > 999

    count_under_thousands_for(number)
  end

  def count_under_thousands_for(number)
    number.digits.reverse!.then do |leading_digit, *rest_of_digits|
      COUNT_BY_UNIQUELY_NAMED_NUMBER[leading_digit] +
        HUNDRED_COUNT + case rest_of_digits.join.to_i
                        in rest if rest.positive?
                          AND_COUNT + letter_count_for(rest)
                        else
                          0
                        end
    end
  end

  COUNT_BY_UNIQUELY_NAMED_NUMBER = {
    1 => :one.length,
    2 => :two.length,
    3 => :three.length,
    4 => :four.length,
    5 => :five.length,
    6 => :six.length,
    7 => :seven.length,
    8 => :eight.length,
    9 => :nine.length,
    10 => :ten.length,
    11 => :eleven.length,
    12 => :twelve.length,
    13 => :thirteen.length,
    14 => :fourteen.length,
    15 => :fifteen.length,
    16 => :sixteen.length,
    17 => :seventeen.length,
    18 => :eighteen.length,
    19 => :nineteen.length
  }.freeze
  COUNT_BY_TENS = {
    2 => :twenty.length,
    3 => :thirty.length,
    4 => :forty.length,
    5 => :fifty.length,
    6 => :sixty.length,
    7 => :seventy.length,
    8 => :eighty.length,
    9 => :ninety.length
  }.freeze
  HUNDRED_COUNT = :hundred.length
  AND_COUNT = :and.length

  private_constant(
    :COUNT_BY_UNIQUELY_NAMED_NUMBER,
    :COUNT_BY_TENS,
    :HUNDRED_COUNT,
    :AND_COUNT
  )
end
