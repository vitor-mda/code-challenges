# frozen_string_literal: true

require 'spec_helper'
require 'smallest_multiple/smallest_multiple'

RSpec.describe SmallestMultiple do
  describe '::divisible_by_each_number' do
    subject { described_class.divisible_by_each_number(from:, to:) }

    context 'when from 1 to 10' do
      let(:from) { 1 }
      let(:to) { 10 }

      it { is_expected.to eq 2520 }
    end

    context 'when from 1 to 20' do
      let(:from) { 1 }
      let(:to) { 20 }

      it { is_expected.to eq 232_792_560 }
    end
  end
end
