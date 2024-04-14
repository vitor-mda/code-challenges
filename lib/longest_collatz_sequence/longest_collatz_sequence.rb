# frozen_string_literal: true

class LongestCollatzSequence
  class << self
    def longest_chain_producer_under(max_starting_number)
      longest_chain_producer = 0
      longest_chain_size = 0

      (1...max_starting_number).each do |starting_number|
        chain_size = chain_size_for(starting_number)
        if chain_size > longest_chain_size
          longest_chain_producer = starting_number
          longest_chain_size = chain_size
        end
      end

      longest_chain_producer
    end

    private

    def chain_size_for(number)
      size = 1
      last_number = number

      until last_number == 1
        size += 1
        last_number = last_number.even? ? last_number / 2 : (3 * last_number) + 1
      end

      size
    end
  end
end
