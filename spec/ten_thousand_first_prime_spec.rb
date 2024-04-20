# frozen_string_literal: true

require 'spec_helper'
require 'ten_thousand_first_prime/ten_thousand_first_prime'

RSpec.describe TenThousandFirstPrime do
  describe '.fetch' do
    subject { described_class.fetch(nth_prime:) }

    context 'when fetching the 6th prime' do
      def nth_prime = 6

      it { is_expected.to eq 13 }
    end

    context 'when fetching the 10001th prime' do
      def nth_prime = 10_001

      it { is_expected.to eq 104_743 }
    end
  end
end
