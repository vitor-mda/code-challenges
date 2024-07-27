# frozen_string_literal: true

require 'maximum_path_sum/maximum_path_sum'

RSpec.describe MaximumPathSum do
  describe '.from' do
    subject { described_class.from(triangle:) }

    context 'with a 2-row triangle having 18 as maximum path sum' do
      def triangle
        # rubocop:disable Layout
        [
           [9],
          [1,9]
        ]
        # rubocop:enable Layout
      end

      it { is_expected.to eq 18 }
    end

    context 'with a 3-row triangle having 27 as maximum path sum' do
      def triangle
        # rubocop:disable Layout
        [
            [9],
           [9,1],
          [9,1,1]
        ]
        # rubocop:enable Layout
      end

      it { is_expected.to eq 27 }
    end

    context 'with a 4-row triangle having 23 as maximum path sum' do
      def triangle
        # rubocop:disable Layout
        [
             [3],
            [7,4],
           [2,4,6],
          [8,5,9,3]
        ]
        # rubocop:enable Layout
      end

      it { is_expected.to eq 23 }
    end

    context 'with a 15-row triangle having 1074 as maximum path sum' do
      def triangle
        # rubocop:disable Layout
        [
                        [75],
                       [95,64],
                      [17,47,82],
                     [18,35,87,10],
                    [20, 4,82,47,65],
                   [19, 1,23,75, 3,34],
                  [88, 2,77,73, 7,63,67],
                 [99,65, 4,28, 6,16,70,92],
                [41,41,26,56,83,40,80,70,33],
               [41,48,72,33,47,32,37,16,94,29],
              [53,71,44,65,25,43,91,52,97,51,14],
             [70,11,33,28,77,73,17,78,39,68,17,57],
            [91,71,52,38,17,14,91,43,58,50,27,29,48],
           [63,66, 4,68,89,53,67,30,73,16,69,87,40,31],
          [ 4,62,98,27,23, 9,70,98,73,93,38,53,60, 4,23]
        ]
        # rubocop:enable Layout
      end

      it { is_expected.to eq 1074 }
    end
  end
end
