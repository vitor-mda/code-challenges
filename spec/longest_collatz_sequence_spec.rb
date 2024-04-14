# frozen_string_literal: true

require 'spec_helper'
require 'longest_collatz_sequence/longest_collatz_sequence'

RSpec.describe LongestCollatzSequence do
  describe '.longest_chain_producer_under' do
    subject { described_class.longest_chain_producer_under(max_starting_number) }

    context 'when max starting number is 2' do
      def max_starting_number = 2

      it { is_expected.to eq 1 }
    end

    context 'when max starting number is 3' do
      def max_starting_number = 3

      it { is_expected.to eq 2 }
    end

    context 'when max starting number is 5' do
      def max_starting_number = 5

      it { is_expected.to eq 3 }
    end

    context 'when max starting number is 1_000_000' do
      def max_starting_number = 1_000_000

      it { is_expected.to eq 837_799 }
    end
  end
end
