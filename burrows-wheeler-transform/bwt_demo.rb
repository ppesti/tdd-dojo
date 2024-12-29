#!/usr/bin/env ruby

# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'bwt_naive'

puts 'Burrows-Wheeler Transformation'
input = 'BANANA'

puts "\n=== Naive Approach ==="

null_terminated_naive = BwtNaive.get_str_with_null_terminator(input)
puts "#1 null terminate the input string: #{null_terminated_naive} (input: #{input})"

transform_arr_naive = BwtNaive.get_bwt_arr(null_terminated_naive)
puts "#2 transform the input n-1 times: #{transform_arr_naive}"

bwt = BwtNaive.burrows_wheeler_transform(input)
puts "#3 sort the transform array and concatenate the last characters to get the BWT: #{bwt}"

puts "\n=== Optimized approach ==="

puts 'To be implemented...'
