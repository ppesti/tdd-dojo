# frozen_string_literal: true

require 'halving'

require 'timeout'

describe Halving do
  describe '.node_halving_starter' do
    it 'returns [] when [] is passed' do
      expect(Halving.node_halving_starter([])).to eq([])
    end

    it 'returns [] when there are no marked elements among the nodes passed' do
      expect(Halving.node_halving_starter([Node.new('lovas', false), Node.new(1, false)])).to eq([])
    end

    context 'nodes' do
      [
        # 1 node is marked
        {
          input: [Node.new(1, true)],
          expected: [Node.new(1, true)]
        },
        {
          input: [Node.new(2, false), Node.new(1, true)],
          expected: [Node.new(1, true)]
        },
        # 2 nodes are marked
        {
          input: [Node.new(1, true), Node.new(2, true)],
          expected: [Node.new(1, true), Node.new(2, true)]
        },
        {
          input: [Node.new(1, false), Node.new(2, true), Node.new(3, false), Node.new(4, true)],
          expected: [Node.new(2, true), Node.new(4, true)]
        }
      ].each do |test_case|
        it 'returns the marked nodes' do
          expect(Halving.node_halving_starter(test_case[:input])).to eq(test_case[:expected])
        end
      end
    end
  end
end
