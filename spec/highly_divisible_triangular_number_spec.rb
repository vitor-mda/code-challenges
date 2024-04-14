# frozen_string_literal: true

require 'spec_helper'
require 'highly_divisible_triangular_number/highly_divisible_triangular_number'

RSpec.describe HighlyDivisibleTriangularNumber do
  describe '.first_with_over' do
    subject(:triangular_number) { described_class.first_with_over(divisors:) }

    context 'with over 1 divisor' do
      def divisors = 1

      it { is_expected.to eq 3 }
    end

    context 'with over 2 divisors' do
      def divisors = 2

      it { is_expected.to eq 6 }
    end

    context 'with over 5 divisors' do
      def divisors = 5

      it { is_expected.to eq 28 }
    end

    context 'with over 50 divisors' do
      def divisors = 50

      it { is_expected.to eq 25_200 }
    end

    context 'with over 120 divisors' do
      def divisors = 120

      it { is_expected.to eq 157_080 }
    end

    context 'with over 500 divisors' do
      def divisors = 500

      it { is_expected.to eq 76_576_500 }
    end
  end
end
