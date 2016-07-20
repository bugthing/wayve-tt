module Task3
  def largest_path_total_for(pyramid)
    py = Pyramid.new(pyramid)

    trav = Traverser.new(py)

    trav.path.reduce(0, :+)
  end
  module_function :largest_path_total_for
end

# These classes should be arranged into their own files
# but for ease of writing and review they are inline

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
    this_line_index = index_of_next_largest_number(line, prev_line_index)
    path << line[this_line_index]
    level_index += 1
    pyramid.lines.count != level_index ? walk_down(level_index, this_line_index, path) : path
  end

  def index_of_next_largest_number(arr, index)
    number1 = arr[index]
    number2 = arr[index + 1]
    number2 > number1 ? (index + 1) : index
  end
end

class Pyramid
  class InvalidPyramidException < RuntimeError; end

  attr_reader :lines

  def initialize(str)
    @lines = parse(str)
    raise(InvalidPyramidException, 'Pyramid does not look right') unless valid?
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
