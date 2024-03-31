# frozen_string_literal: true

class LargestProductInAGrid
  SEQUENCE_LENGTH = 4

  def self.find(grid) = new(grid).find

  def initialize(grid)
    @grid = grid
    @last_column_index_with_a_horizontal_sequence = grid.length - SEQUENCE_LENGTH
    @last_row_index_with_a_vertical_sequence = grid.length - SEQUENCE_LENGTH
    @first_row_index_with_an_ascending_diagonal_sequence = SEQUENCE_LENGTH
    @largest_product = 0
  end

  def find
    check_sequences_products
    @largest_product
  end

  private

  def check_sequences_products
    @grid.each_index do |row_index|
      check_horizontal_sequences_in(row_index)

      unless row_index > @last_row_index_with_a_vertical_sequence
        check_vertical_sequences_in(row_index)
        check_descending_diagonal_sequences_in(row_index)
      end

      unless row_index < @first_row_index_with_an_ascending_diagonal_sequence
        check_ascending_diagonal_sequences_in(row_index)
      end
    end
  end

  def check_horizontal_sequences_in(row_index)
    (0..@last_column_index_with_a_horizontal_sequence).each do |start_column_index|
      (start_column_index...(start_column_index + SEQUENCE_LENGTH))
        .map { |column_index| @grid[row_index][column_index] }
        .reduce(&:*)
        .tap { if_largest_product_update_with(_1) }
    end
  end

  def if_largest_product_update_with(largest_product_candidate)
    @largest_product = largest_product_candidate if largest_product_candidate > @largest_product
  end

  def check_vertical_sequences_in(start_row_index)
    (0...(@grid.length)).each do |column_index|
      (start_row_index...(start_row_index + SEQUENCE_LENGTH))
        .map { |row_index| @grid[row_index][column_index] }
        .reduce(&:*)
        .tap { if_largest_product_update_with(_1) }
    end
  end

  def check_descending_diagonal_sequences_in(row_index)
    (0..@last_column_index_with_a_horizontal_sequence).each do |column_index|
      (0...SEQUENCE_LENGTH)
        .map { |offset| @grid[row_index + offset][column_index + offset] }
        .reduce(&:*)
        .tap { if_largest_product_update_with(_1) }
    end
  end

  def check_ascending_diagonal_sequences_in(row_index)
    (0..@last_column_index_with_a_horizontal_sequence).each do |column_index|
      (0...SEQUENCE_LENGTH)
        .map { |offset| @grid[row_index - offset][column_index + offset] }
        .reduce(&:*)
        .tap { if_largest_product_update_with(_1) }
    end
  end
end
