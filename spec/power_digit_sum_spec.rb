# frozen_string_literal: true

require 'spec_helper'
require 'power_digit_sum/power_digit_sum'

RSpec.describe PowerDigitSum do
  describe '.of_the_number' do
    subject { described_class.of_the_number(number, to_the_power_of:) }

    context 'with 2**15' do
      def number = 2
      def to_the_power_of = 15

      it { is_expected.to eq 26 }
    end

    context 'with 2**1000' do
      def number = 2
      def to_the_power_of = 1000

      it { is_expected.to eq 1366 }
    end
  end
end
