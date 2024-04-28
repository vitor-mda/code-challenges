# frozen_string_literal: true

require 'number_letter_counts/number_letter_counts'

RSpec.describe NumberLetterCounts do
  describe '.from' do
    subject(:count) { described_class.from(from, to:) }

    context 'when from 1 to 2' do
      def from = 1
      def to = 2

      it { expect(count).to eq 6 }
    end

    context 'when from 1 to 5' do
      def from = 1
      def to = 5

      it { expect(count).to eq 19 }
    end

    context 'when from 1 to 19' do
      def from = 1
      def to = 19

      it { expect(count).to eq 106 }
    end

    context 'when from 20 to 21' do
      def from = 20
      def to = 21

      it { expect(count).to eq 15 }
    end

    context 'when from 98 to 99' do
      def from = 98
      def to = 99

      it { expect(count).to eq 21 }
    end

    context 'when from 100 to 101' do
      def from = 100
      def to = 101

      it { expect(count).to eq 26 }
    end

    context 'when from 998 to 999' do
      def from = 998
      def to = 999

      it { expect(count).to eq 49 }
    end

    context 'when from 999 to 1000' do
      def from = 999
      def to = 1000

      it { expect(count).to eq 35 }
    end

    context 'when from 1 to 1000' do
      def from = 1
      def to = 1000

      it { expect(count).to eq 21_124 }
    end
  end
end
