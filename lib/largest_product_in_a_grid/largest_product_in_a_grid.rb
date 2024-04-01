# frozen_string_literal: true

class LargestProductInAGrid
  SEQUENCE_LENGTH = 4
  private_constant :SEQUENCE_LENGTH

  def self.find(grid) = new(grid).find

  def initialize(grid)
    @grid = grid
    @last_row_and_column_index_with_a_descending_diagonal_sequence = grid.length - SEQUENCE_LENGTH
    @first_row_index_with_an_ascending_diagonal_sequence = SEQUENCE_LENGTH
    @largest_product = 0
  end

  def find = check_every_sequence_product.then { @largest_product }

  private

  def check_every_sequence_product
    @grid.each_index do |row_index|
      check_rightward_sequences_in(row_index)

      if can_sequentiate_downwardly?(row_index)
        check_downward_sequences_in(row_index)
        check_descending_diagonal_sequences_in(row_index)
      end

      check_ascending_diagonal_sequences_in(row_index) if can_sequentiate_ascendingly?(row_index)
    end
  end

  def check_rightward_sequences_in(row_index)
    rightwardly_sequentiable_columns.each do |start_column_index|
      columns_in_rightward_sequence_for(start_column_index)
        .map { |column_index| @grid[row_index][column_index] }
        .reduce(&:*)
        .tap { if_largest_product_update_with(_1) }
    end
  end

  def rightwardly_sequentiable_columns
    @rightwardly_sequentiable_columns ||= (0..@last_row_and_column_index_with_a_descending_diagonal_sequence)
  end

  def columns_in_rightward_sequence_for(start_column_index)
    (start_column_index...(start_column_index + SEQUENCE_LENGTH))
  end

  def if_largest_product_update_with(largest_product_candidate)
    @largest_product = largest_product_candidate if largest_product_candidate > @largest_product
  end

  def can_sequentiate_downwardly?(row_index)
    row_index <= @last_row_and_column_index_with_a_descending_diagonal_sequence
  end

  def check_downward_sequences_in(start_row_index)
    all_columns.each do |column_index|
      rows_in_downward_sequence_for(start_row_index)
        .map { |row_index| @grid[row_index][column_index] }
        .reduce(&:*)
        .tap { if_largest_product_update_with(_1) }
    end
  end

  def all_columns = @all_columns ||= (0...(@grid.length))

  def rows_in_downward_sequence_for(start_row_index) = (start_row_index...(start_row_index + SEQUENCE_LENGTH))

  def check_descending_diagonal_sequences_in(row_index)
    rightwardly_sequentiable_columns.each do |column_index|
      sequence_offsets
        .map { |offset| @grid[row_index + offset][column_index + offset] }
        .reduce(&:*)
        .tap { if_largest_product_update_with(_1) }
    end
  end

  def sequence_offsets = @sequence_offsets ||= (0...SEQUENCE_LENGTH)

  def can_sequentiate_ascendingly?(row_index) = row_index >= @first_row_index_with_an_ascending_diagonal_sequence

  def check_ascending_diagonal_sequences_in(row_index)
    rightwardly_sequentiable_columns.each do |column_index|
      sequence_offsets
        .map { |offset| @grid[row_index - offset][column_index + offset] }
        .reduce(&:*)
        .tap { if_largest_product_update_with(_1) }
    end
  end
end
