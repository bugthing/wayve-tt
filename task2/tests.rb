require 'minitest/autorun'

require_relative 'solution'

class TestTask2 < MiniTest::Unit::TestCase
  def test_it_finds_the_longest_value
    hash = { key1: 'one', key2: 'two', key3: 'three' }
    assert_equal 'three', Task2.longest_string(hash)
  end

  def test_when_all_values_same_length
    hash = { key1: 'a', key2: 'b' }
    assert_equal 'a', Task2.longest_string(hash)
  end

  def test_when_there_is_a_nil_value
    hash = { key1: nil, key2: '' }
    assert_equal '', Task2.longest_string(hash)
  end
end
