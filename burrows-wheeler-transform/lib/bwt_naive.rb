# frozen_string_literal: true

# the naive/non-optimized implementation of the Burrows-Wheeler Transform
class BwtNaive
  NULL_TERM = '$'

  def self.get_str_with_null_terminator(str)
    str + NULL_TERM
  end

  def self.transform(str)
    return '' if !str || str.empty?

    str[-1] + str[0..-2]
  end

  def self.get_bwt_arr(str)
    transform_arr = [str]
    input = str

    (1..str.length - 1).each do |i|
      transform_arr[i] = transform(input)
      input = transform_arr[i]
    end

    transform_arr
  end

  def self.burrows_wheeler_transform(str)
    res = ''
    transform_arr = get_bwt_arr(get_str_with_null_terminator(str)).sort

    transform_arr.each do |s|
      res += s[-1]
    end

    res
  end
end
