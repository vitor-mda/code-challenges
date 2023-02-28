# frozen_string_literal: true

class EvenFibonacciNumbers
  class << self
    def sum_even_terms_below(ceiling)
      even_terms_below(ceiling).sum
    end

    private

    def even_terms_below(ceiling)
      fibonacci_sequence
        .take_while { |_, term| term < ceiling }
        .filter { |_, term| term.even? }
        .map(&:last)
    end

    def fibonacci_sequence
      Enumerator.produce([1, 2]) { |previous_term, current_term| [current_term, current_term + previous_term] }
    end
  end
end
