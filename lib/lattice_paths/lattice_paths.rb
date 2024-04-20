# frozen_string_literal: true

class LatticePaths
  def self.routes_count_for(square_grid_of_size:) = new(square_grid_of_size).routes_count

  def initialize(square_grid_size) = @grid_size = square_grid_size

  def routes_count = total_routes_from(routes_diagonally_infered_from_destination_to_midway_to_origin)

  private

  def routes_diagonally_infered_from_destination_to_midway_to_origin
    @grid_size.times.reduce([]) { |counts, _| counts.each_cons(2).map(&:sum).unshift(1).push(1) }
  end

  def total_routes_from(diagonal_routes_counts)
    @grid_size.times.reduce(diagonal_routes_counts) { |counts, _| counts.each_cons(2).map(&:sum) }.pop
  end
end
