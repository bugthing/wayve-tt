require 'minitest/autorun'

require_relative 'solution'

class TestTask1 < MiniTest::Unit::TestCase
  def test_it_detects_even_palindrome
    word = 'abccba'
    assert_equal true, Task1.palindrome?(word)
  end

  def test_it_detects_odd_palindrome
    word = 'asa'
    assert_equal true, Task1.palindrome?(word)
  end

  def test_it_detects_non_palindrome
    word = 'aab'
    assert_equal false, Task1.palindrome?(word)
  end

  def test_empty_string
    word = ''
    assert_equal true, Task1.palindrome?(word)
  end
end
