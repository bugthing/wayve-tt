#!/usr/bin/env ruby

rows = ARGV[0].to_i || 10

2.upto(rows) do |i|
  puts ' ' * (rows - i) + Array.new((i * 1 - 1)) { 1 + Random.rand(98) }.join(' ') + ' ' * (rows - i)
end
