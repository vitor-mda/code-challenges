# frozen_string_literal: true

require 'spec_helper'
require 'even_fibonacci_numbers/even_fibonacci_numbers'

RSpec.describe EvenFibonacciNumbers do
  describe '.sum_even_terms_below' do
    subject { described_class.sum_even_terms_below(ceiling) }

    context 'when ceiling is 50' do
      def ceiling = 50

      it { is_expected.to eq 44 }
    end

    context 'when ceiling is 4_000_000' do
      def ceiling = 4_000_000

      it { is_expected.to eq 4_613_732 }
    end
  end
end
