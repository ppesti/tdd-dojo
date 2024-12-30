# frozen_string_literal: true

# optimized implementation of the Burrows-Wheeler Transform
class Bwt
  NULL_TERM = '$'

  def self.get_str_with_null_terminator(str)
    str + NULL_TERM
  end

  def self.get_unsorted_suffix_arr(str)
    suffixes = []

    (0..str.length - 1).each do |i|
      suffixes << [i, str[i, str.length]]
    end

    suffixes
  end

  # sorted by suffixes
  def self.get_suffix_arr(str)
    get_unsorted_suffix_arr(str).sort_by { |_, suffix| suffix }
  end

  def self.burrows_wheeler_transform(str)
    null_terminated_str = get_str_with_null_terminator str
    bws = get_suffix_arr null_terminated_str

    res = bws.map do |i, _|
      i.zero? ? null_terminated_str[-1] : null_terminated_str[i - 1]
    end

    res.join
  end
end
