# frozen_string_literal: true

require 'bwt_naive'

describe BwtNaive do
  # '$' is BwtNaive::NULL_TERM, but simply '$' is used for better readability
  describe '.get_str_with_null_terminator' do
    it 'returns the string passed with the null terminator appended' do
      input_text = 'BANANA'
      expect(BwtNaive.get_str_with_null_terminator(input_text)).to eq("#{input_text}$")
    end

    it 'returns the null terminator for empty string input' do
      expect(BwtNaive.get_str_with_null_terminator('')).to eq('$')
    end
  end

  describe '.transform' do
    context 'BANANA' do
      [
        { input: 'BANANA$', expected: '$BANANA' },
        { input: '$BANANA', expected: 'A$BANAN' },
        { input: 'A$BANAN', expected: 'NA$BANA' },
        { input: 'NA$BANA', expected: 'ANA$BAN' },
        { input: 'ANA$BAN', expected: 'NANA$BA' },
        { input: 'NANA$BA', expected: 'ANANA$B' }
      ].each do |test_case|
        it "returns '#{test_case[:expected]}' for input '#{test_case[:input]}'" do
          expect(BwtNaive.transform(test_case[:input])).to eq(test_case[:expected])
        end
      end
    end

    it 'returns empty string for empty string input' do
      expect(BwtNaive.transform('')).to eq('')
    end

    it 'returns the input for 1 long inputs' do
      expect(BwtNaive.transform('a')).to eq('a')
    end
  end

  describe '.get_bwt_arr' do
    context 'transform arrays' do
      [
        { input: 'BANANA$', expected: ['BANANA$',
                                       '$BANANA',
                                       'A$BANAN',
                                       'NA$BANA',
                                       'ANA$BAN',
                                       'NANA$BA',
                                       'ANANA$B'] },
        { input: 'islanders$', expected: ['islanders$',
                                          '$islanders',
                                          's$islander',
                                          'rs$islande',
                                          'ers$island',
                                          'ders$islan',
                                          'nders$isla',
                                          'anders$isl',
                                          'landers$is',
                                          'slanders$i'] },
        { input: '123$', expected: ['123$',
                                    '$123',
                                    '3$12',
                                    '23$1'] }
      ].each do |test_case|
        it 'returns the array of outputs of the transformation steps' do
          expect(BwtNaive.get_bwt_arr(test_case[:input])).to eq(test_case[:expected])
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
          expect(BwtNaive.burrows_wheeler_transform(test_case[:input])).to eq(test_case[:expected])
        end
      end
    end
  end
end
