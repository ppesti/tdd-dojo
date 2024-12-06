# frozen_string_literal: true

require 'scramble_test'

RSpec.describe ScrambleTest do
  describe '.scramble' do
    it 'scrambles the text passed as parameter' do
      input_text = 'this is a random text eh'
      expect(ScrambleTest.scramble(input_text)).to eq(input_text)
    end
  end

  context '.scramble_word' do
    [
      { input: ''    },
      { input: '   ' },
      { input: 'y'   },
      { input: 'ab'  },
      { input: 'abc' }
    ].each do |test_case|
      it "should return the input string '#{test_case[:input]}'" do
        expect(ScrambleTest.scramble_word(test_case[:input])).to eq(test_case[:input])
      end
    end
  end

  context '.scramble_word' do
    [
      { input: 'dummy', expected: 'dmmuy'         },
      { input: 'islanders', expected: 'irednalss' }
    ].each do |test_case|
      it "should return '#{test_case[:expected]}' for input '#{test_case[:input]}'" do
        expect(ScrambleTest.scramble_word(test_case[:input])).to eq(test_case[:expected])
      end
    end
  end
end
