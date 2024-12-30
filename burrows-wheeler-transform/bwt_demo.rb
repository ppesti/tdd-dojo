#!/usr/bin/env ruby

# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'bwt_naive'
require 'bwt'

puts 'Burrows-Wheeler Transformation'
input = 'BANANA'

puts "\n=== Naive Approach ==="

null_terminated_naive = BwtNaive.get_str_with_null_terminator input
puts "#1 null terminate the input string: #{null_terminated_naive} (input: #{input})"

transform_arr_naive = BwtNaive.get_bwt_arr null_terminated_naive
puts "#2 transform the input n-1 times: #{transform_arr_naive}"

bwt_naive = BwtNaive.burrows_wheeler_transform input # this is the only method you would need to call
puts "#3 sort the transform array and concatenate the last characters to get the BWT: #{bwt_naive}"

puts "\n=== Optimized approach ==="

null_terminated = Bwt.get_str_with_null_terminator input
puts "#1 null terminate the input string: #{null_terminated} (input: #{input})"

unsorted_suffixes = Bwt.get_unsorted_suffix_arr null_terminated
puts "#2 get all possible suffixes: #{unsorted_suffixes}"

suffix_array = Bwt.get_suffix_arr null_terminated
puts "#3 construct the sorted suffix array (BWS): #{suffix_array}"

bwt = Bwt.burrows_wheeler_transform input # this is the only method you would need to call
puts "#4 construct the BWT from the BWS: #{bwt}"
