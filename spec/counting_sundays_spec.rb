# frozen_string_literal: true

require 'counting_sundays/counting_sundays'
require 'date'

RSpec.describe CountingSundays do
  describe '.on_the_first_of_the_month' do
    subject { described_class.on_the_first_of_the_month(from:, to:) }

    context 'when from 2024-04-01 to 2024-04-30' do
      def from = Date.new(2024, 4, 1)
      def to   = Date.new(2024, 4, 30)

      it { is_expected.to eq 0 }
    end

    context 'when from 2024-09-01 to 2024-09-30' do
      def from = Date.new(2024, 9, 1)
      def to   = Date.new(2024, 9, 30)

      it { is_expected.to eq 1 }
    end

    context 'when from 2024-01-01 to 2024-12-31' do
      def from = Date.new(2024, 1, 1)
      def to   = Date.new(2024, 12, 31)

      it { is_expected.to eq 2 }
    end

    context 'when from 1901-01-01 to 2000-12-31' do
      def from = Date.new(1901, 1, 1)
      def to   = Date.new(2000, 12, 31)

      it { is_expected.to eq 171 }
    end
  end
end
