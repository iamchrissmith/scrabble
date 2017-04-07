gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 1, Scrabble.new.score("A")
    assert_equal 4, Scrabble.new.score("f")
    assert_equal 4, Scrabble.new.score("F")
  end

  def test_it_can_score_a_word
    assert_equal 9, Scrabble.new.score("apple")
    assert_equal 9, Scrabble.new.score("Apple")
    assert_equal 12, Scrabble.new.score("frank")
    assert_equal 12, Scrabble.new.score("Frank")
  end

  def test_it_returns_0_for_empty_and_nil
    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score(nil)
  end
end
