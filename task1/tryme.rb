#!/usr/bin/env ruby

require_relative 'solution'

# get input an ensure its sane
word = ARGV[0].chomp
word = word.to_s
fail 'Please provide a word to test' if word == ''

puts (Task1.palindrome?(word) ? 'this IS a palindrome' : 'this is NOT a palindrome')
