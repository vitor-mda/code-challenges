# frozen_string_literal: true

require 'special_pythagorean_triplet/special_pythagorean_triplet'

RSpec.describe SpecialPythagoreanTriplet do
  describe '.product_of_a_triplet_which_the_sum_equals' do
    subject { described_class.product_of_a_triplet_which_the_sum_equals(sum) }

    context 'when sum equals 12' do
      def sum = 12

      it { is_expected.to eq 60 }
    end

    context 'when sum equals 1000' do
      def sum = 1000

      it { is_expected.to eq 31_875_000 }
    end
  end
end
