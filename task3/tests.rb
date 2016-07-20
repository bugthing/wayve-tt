require 'minitest/autorun'

require_relative 'solution'

class TestTask3 < MiniTest::Unit::TestCase
  def test_when_using_example_pyramid
    pyramid = <<EXAMPLE1
   4
  7 4
 2 4 6
8 5 9 3
EXAMPLE1

    assert_equal 24, Task3.largest_path_total_for(pyramid)
  end

  def test_when_path_down_right_side
    pyramid = <<EXAMPLE1
   2
  1 2
 1 1 2
1 1 1 2
EXAMPLE1

    assert_equal 8, Task3.largest_path_total_for(pyramid)
  end

  def test_when_path_down_left_side
    pyramid = <<EXAMPLE1
   2
  3 1
 4 1 1
5 1 1 1
EXAMPLE1

    assert_equal 14, Task3.largest_path_total_for(pyramid)
  end
end

class TestPyramid < MiniTest::Unit::TestCase
  def test_it_can_parse
    pyramid = <<PYRAMID1
   4
  7 4
 2 99 6
8 5 9 3
PYRAMID1

    assert_instance_of Pyramid, Pyramid.new(pyramid)
  end

  def test_throws_if_empty
    assert_raises { Pyramid.new '' }
  end

  def test_throws_if_not_all_numbers
    pyramid = <<PYRAMID2
   4
  7 X
PYRAMID2

    assert_raises(Pyramid::InvalidPyramidException) { Pyramid.new pyramid }
  end

  def test_throws_if_too_many_on_a_row
    pyramid = <<PYRAMID2
   4
  7 5 8
PYRAMID2

    assert_raises(Pyramid::InvalidPyramidException) { Pyramid.new pyramid }
  end

  def test_throws_if_number_too_high
    pyramid = <<PYRAMID2
   4
  7 100
PYRAMID2

    assert_raises(Pyramid::InvalidPyramidException) { Pyramid.new pyramid }
  end

  def test_throws_if_number_too_low
    pyramid = <<PYRAMID2
   4
  7 0
PYRAMID2

    assert_raises(Pyramid::InvalidPyramidException) { Pyramid.new pyramid }
  end
end
