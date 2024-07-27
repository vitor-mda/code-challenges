# frozen_string_literal: true

class MaximumPathSum
  def self.from(triangle:) = new(triangle:).find

  def initialize(triangle:)
    @initial_row = triangle.shift
    @summable_rows = triangle
  end

  def find
    summable_rows
      .reduce(initial_row) { |previous_row, summable_row| summed_row(previous_row, summable_row) }
      .max
  end

  private

  attr_reader :initial_row, :summable_rows

  def summed_row(previous_row, summable_row)
    first_sum = summable_row.shift + previous_row.first
    last_sum = summable_row.pop + previous_row.last

    [first_sum]
      .concat(rest_max_sum(previous_row, summable_row))
      .append(last_sum)
  end

  def rest_max_sum(previous_row, summable_row_rest)
    summable_row_rest.map!.with_index do |number, index|
      [
        number + previous_row[index],
        number + previous_row[index + 1]
      ].max
    end
  end
end
