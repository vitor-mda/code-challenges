# frozen_string_literal: true

class LargestPalindromeProduct
  def self.from_two_numbers_with(digits:)
    new(digits).execute
  end

  def execute
    numbers_sequence.filter_map do |n1|
      n1.downto(@lower_bound).filter_map do |n2|
        (n1 * n2).then { |result| result if palindrome?(result) }
      end.max
    end.max
  end

  private

  def initialize(digits)
    @upper_bound = upper_bound(digits)
    @lower_bound = lower_bound(digits)
  end

  def numbers_sequence
    @upper_bound.downto @lower_bound
  end

  def palindrome?(number)
    number.digits.then { |digits| digits == digits.reverse }
  end

  def upper_bound(digits)
    return 9 if digits == 1

    calculate_bound(9, digits) { |n| (n * 10) + 9 }
  end

  def lower_bound(digits)
    return 1 if digits == 1

    calculate_bound(1, digits) { |n| n * 10 }
  end

  def calculate_bound(number, digits, &block)
    return calculate_bound(block.call(number), digits, &block) if number.digits.length < digits

    number
  end
end
