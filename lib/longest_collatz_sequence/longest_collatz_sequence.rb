# frozen_string_literal: true

class LongestCollatzSequence
  def self.longest_chain_producer_under(max_starting_number) = new(max_starting_number).find

  def initialize(max_starting_number)
    @max_starting_number = max_starting_number
    @chain_size_by_number = { 1 => 1 }
    @longest_chain_producer = 1
    @longest_chain_size = 1
  end

  def find
    calculate_longest_producer

    @longest_chain_producer
  end

  private

  def calculate_longest_producer
    starting_numbers.each do |starting_number|
      chain_size_for(starting_number).tap do |size|
        update(longest_chain_producer: starting_number, longest_chain_size: size) if size > @longest_chain_size
      end
    end
  end

  def starting_numbers = (1...@max_starting_number)

  def chain_size_for(number)
    size = 0
    last_number = number

    loop do
      break size += @chain_size_by_number[last_number] if @chain_size_by_number.key?(last_number)

      size += 1
      last_number = last_number.even? ? last_number / 2 : (3 * last_number) + 1
    end

    @chain_size_by_number[number] = size
  end

  def update(longest_chain_producer:, longest_chain_size:)
    @longest_chain_producer = longest_chain_producer
    @longest_chain_size = longest_chain_size
  end
end
