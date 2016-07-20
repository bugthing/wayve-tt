module Task3
  def largest_path_total_for(pyramid)
    py = Pyramid.new(pyramid)

    trav = Traverser.new(py)

    trav.path.reduce(0, :+)
  end
  module_function :largest_path_total_for
end

# These classes should be arranged into their own files
# but for ease of writing and review they are here

class Traverser
  attr_reader :pyramid

  def initialize(pyramid)
    @pyramid = pyramid
  end

  def path
	path = [pyramid.lines[0][0]]
	walk_down(1, 0, path)
  end

  private

  def walk_down(level_index, prev_line_index, path)
	line = pyramid.lines[level_index]
    number1, number2 = line[prev_line_index], line[prev_line_index + 1]
    this_line_index = prev_line_index
	if number2 > number1
      this_line_index = prev_line_index + 1
	end
	path << line[this_line_index]

	level_index += 1
    if pyramid.lines.count != level_index
	  walk_down(level_index, this_line_index, path)
	end

    path
  end
end

class Pyramid
  class InvalidPyramidException < RuntimeError; end

  attr_reader :lines

  def initialize(str)
    @lines = parse(str)
    fail(InvalidPyramidException, 'Pyramid does not look right') unless valid?
  end

  private

  def valid?
    !(lines.count < 1 || any_invalid_numbers? || incorrect_numbers_per_row?)
  end

  def any_invalid_numbers?
    lines.flatten.any? { |i| i > 99 || i < 1 }
  end

  def incorrect_numbers_per_row?
    lines.each.with_index.any? do |line, i|
      line.count != (i + 1)
    end
  end

  # TODO: improve clarity of code, consider introducing LineParser class
  def parse(str)
    str.lines.map do |line|
      line.chomp.split(/\s+/).select { |v| v.match(/^\d+$/) }.map(&:to_i)
    end
  end
end
