# frozen_string_literal: true

require 'spec_helper'
require 'largest_prime_factor/largest_prime_factor'

RSpec.describe LargestPrimeFactor do
  describe '::of' do
    subject { described_class.of(number) }

    context 'when number is 13195' do
      let(:number) { 13_195 }

      it { is_expected.to eq 29 }
    end

    context 'when number is 600851475143' do
      let(:number) { 600_851_475_143 }

      it { is_expected.to eq 6857 }
    end
  end
end
