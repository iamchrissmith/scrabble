gem 'minitest'
require_relative '../lib/word_finder'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordFinderTest < Minitest::Test
  def test_it_find_all_available_words_for_letters
    finder = WordFinder.new
    words = finder.for_letters(['r', 'e', 'x', 'a', 'p', 't', 'o'])
    should_contain = ["a", "ae", "aer", "aero", "ape", "aper", "apert", "apex"]
    assert should_contain.all? do |word|
      words.include?(word)
    end
    assert_equal 141, words.length
  end

  def test_it_finds_words_with_required_letter
    finder = WordFinder.new
    words = finder.for_letters_with(['e', 'x', 'a', 'p', 't', 'o'], 'r')
    should_contain = ["aer", "aero", "aper", "apert", "aport", "ar", "are", "art", "arx", "ear", "er", "era", "export", "extra"]
    assert should_contain.all? do |word|
      words.include?(word)
    end
    assert_equal 85, words.length
  end
end
