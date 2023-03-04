# frozen_string_literal: true

class LargestPalindromeProduct
  class << self
    def from_two_numbers_with(digits:)
      numbers_sequence_from(digits).filter_map do |n1|
        n1.downto(lower_bound(digits)).filter_map do |n2|
          (n1 * n2).then { |result| result if palindrome?(result) }
        end.max
      end.max
    end

    private

    def numbers_sequence_from(digits)
      upper_bound(digits).downto(lower_bound(digits))
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
end
