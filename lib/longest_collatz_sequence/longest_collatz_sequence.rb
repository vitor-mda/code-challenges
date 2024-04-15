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
      break size += memoized(last_number) if memoized?(last_number)

      size += 1
      last_number = next_for(last_number)
    end

    memoize(number, with: size)
    size
  end

  def memoized?(number)      = @chain_size_by_number.key?(number)
  def memoized(number)       = @chain_size_by_number[number]
  def memoize(number, with:) = @chain_size_by_number[number] = with
  def next_for(number)       = number.even? ? number / 2 : (3 * number) + 1

  def update(longest_chain_producer:, longest_chain_size:)
    @longest_chain_producer = longest_chain_producer
    @longest_chain_size = longest_chain_size
  end
end
