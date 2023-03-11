# frozen_string_literal: true

require 'spec_helper'
require 'largest_product_in_a_series/largest_product_in_a_series'

RSpec.describe LargestProductInASeries do
  describe '::of' do
    subject { described_class.of(adjacent_numbers:) }

    context 'when four adjacent numbers' do
      def adjacent_numbers = 4

      it { is_expected.to eq 5832 }
    end

    context 'when thirteen adjacent numbers' do
      def adjacent_numbers = 13

      it { is_expected.to eq 23_514_624_000 }
    end
  end
end
