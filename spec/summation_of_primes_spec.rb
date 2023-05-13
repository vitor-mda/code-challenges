# frozen_string_literal: true

require 'spec_helper'
require 'summation_of_primes/summation_of_primes'

RSpec.describe SummationOfPrimes do
  describe '::sum_of_all_primes_below' do
    subject { described_class.sum_of_all_primes_below(upper_bound) }

    context 'when upper bound is ten' do
      def upper_bound = 10

      it { is_expected.to eq 17 }
    end

    context 'when upper bound is five' do
      def upper_bound = 5

      it { is_expected.to eq 5 }
    end

    context 'when upper bound is two million' do
      def upper_bound = 2_000_000

      it { is_expected.to eq 142_913_828_922 }
    end
  end
end
