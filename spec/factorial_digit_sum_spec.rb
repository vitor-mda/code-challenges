# frozen_string_literal: true

require 'factorial_digit_sum/factorial_digit_sum'

RSpec.describe FactorialDigitSum do
  describe '.of_the_number' do
    subject { described_class.of_the_number(number) }

    context 'when number is 1' do
      def number = 1

      it { is_expected.to eq 1 }
    end

    context 'when number is 2' do
      def number = 2

      it { is_expected.to eq 2 }
    end

    context 'when number is 3' do
      def number = 3

      it { is_expected.to eq 6 }
    end

    context 'when number is 10' do
      def number = 10

      it { is_expected.to eq 27 }
    end

    context 'when number is 100' do
      def number = 100

      it { is_expected.to eq 648 }
    end
  end
end
