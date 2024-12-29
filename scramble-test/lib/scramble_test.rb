# frozen_string_literal: true

class ScrambleTest
  def self.scramble(text)
    text
  end

  def self.scramble_word(word)
    return word if !word || word.length < 4

    word[0] + word[1..-2].reverse + word[-1]
  end
end
