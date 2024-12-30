# frozen_string_literal: true

require 'bwt'

describe Bwt do
  # '$' is Bwt::NULL_TERM, but simply '$' is used for better readability
  describe '.get_str_with_null_terminator' do
    it 'returns the string passed with the null terminator appended' do
      input_text = 'BANANA'
      expect(Bwt.get_str_with_null_terminator(input_text)).to eq("#{input_text}$")
    end

    it 'returns the null terminator for empty string input' do
      expect(Bwt.get_str_with_null_terminator('')).to eq('$')
    end
  end

  describe '.get_unsorted_suffix_arr' do
    it 'returns suffixes from longest to shortest' do
      expect(Bwt.get_unsorted_suffix_arr('BANANA$')).to eq([[0, 'BANANA$'],
                                                            [1, 'ANANA$'],
                                                            [2, 'NANA$'],
                                                            [3, 'ANA$'],
                                                            [4, 'NA$'],
                                                            [5, 'A$'],
                                                            [6, '$']])
    end
  end

  describe '.get_suffix_arr' do
    context 'suffix arrays' do
      [
        { input: 'BANANA$', expected: [[6, '$'],
                                       [5, 'A$'],
                                       [3, 'ANA$'],
                                       [1, 'ANANA$'],
                                       [0, 'BANANA$'],
                                       [4, 'NA$'],
                                       [2, 'NANA$']] }
      ].each do |test_case|
        it 'returns the array of outputs of the transformation steps' do
          expect(Bwt.get_suffix_arr(test_case[:input])).to eq(test_case[:expected])
        end
      end
    end
  end

  describe '.get_bwt' do
    context 'BWT' do
      [
        { input: 'BANANA', expected: 'ANNB$AA' },
        { input: 'islanders', expected: 'slnd$saeri' },
        { input: '123', expected: '3$12' }
      ].each do |test_case|
        it 'returns the Burrows-Wheeler transform of the input' do
          expect(Bwt.burrows_wheeler_transform(test_case[:input])).to eq(test_case[:expected])
        end
      end
    end
  end
end
