#!/usr/bin/env ruby

require_relative 'solution'

pyramid = nil
if STDIN.tty?
  File.open(ARGV[0], 'r') { |f| pyramid = f.read }
else
  pyramid = STDIN.read
end

number = Task3.largest_path_total_for(pyramid)

puts "The magic pyramid number is: #{number}"
