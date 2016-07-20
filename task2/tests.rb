require 'minitest/autorun'

require_relative 'solution'

class TestTask2 < MiniTest::Unit::TestCase
  def test_it_finds_the_longest_value
    hash = { key1: 'one', key2: 'two', key3: 'three' }
    assert_equal 'three', Task2.longest_string(hash)
  end
end
