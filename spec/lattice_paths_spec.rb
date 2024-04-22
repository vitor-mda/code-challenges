# frozen_string_literal: true

require 'lattice_paths/lattice_paths'

RSpec.describe LatticePaths do
  describe '.routes_count_for' do
    subject { described_class.routes_count_for(square_grid_of_size:) }

    context 'with a grid of size 1x1' do
      def square_grid_of_size = 1

      it { is_expected.to eq 2 }
    end

    context 'with a grid of size 2x2' do
      def square_grid_of_size = 2

      it { is_expected.to eq 6 }
    end

    context 'with a grid of size 3x3' do
      def square_grid_of_size = 3

      it { is_expected.to eq 20 }
    end

    context 'with a grid of size 8x8' do
      def square_grid_of_size = 8

      it { is_expected.to eq 12_870 }
    end

    context 'with a grid of size 12x12' do
      def square_grid_of_size = 12

      it { is_expected.to eq 2_704_156 }
    end

    context 'with a grid of size 20x20' do
      def square_grid_of_size = 20

      it { is_expected.to eq 137_846_528_820 }
    end
  end
end
