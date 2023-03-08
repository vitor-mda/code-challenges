# frozen_string_literal: true

require 'spec_helper'
require 'sum_square_difference/sum_square_difference'

RSpec.describe SumSquareDifference do
  describe '::of_the_numbers_between' do
    subject { described_class.of_the_numbers_between(number:, and_number:) }

    context 'when from 1 to 10' do
      def number = 1
      def and_number = 10

      it { is_expected.to eq 2640 }
    end

    context 'when from 1 to 100' do
      def number = 1
      def and_number = 100

      it { is_expected.to eq 25_164_150 }
    end
  end
end
