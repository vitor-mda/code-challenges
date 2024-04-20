# frozen_string_literal: true

require 'spec_helper'
require 'multiples_of3_or5/multiples_of3_or5'

RSpec.describe MultiplesOf3Or5 do
  describe '.sum_of_multiples_below' do
    subject { described_class.sum_of_multiples_below(ceiling) }

    context 'when ceiling is 10' do
      def ceiling = 10

      it { is_expected.to eq 23 }
    end

    context 'when ceiling is 1000' do
      def ceiling = 1000

      it { is_expected.to eq 233_168 }
    end
  end
end
