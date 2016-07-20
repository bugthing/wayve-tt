#!/usr/bin/env ruby

require_relative 'solution'

# get input an ensure its sane
word = ARGV[0].to_s.chomp
if word == ''
  warn 'Please provide a word to test'
  exit 1
end

puts (Task1.palindrome?(word) ? 'this IS a palindrome' : 'this is NOT a palindrome')
