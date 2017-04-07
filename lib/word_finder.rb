class WordFinder
  def words
    words = File.read('/usr/share/dict/words').split("\n")
    # words.map { |word| word.downcase }.uniq
    # words.uniq
    # allowed = ["a","i","o"]
    # words.delete_if {|word| word.length == 1 && !allowed.include?(word)}
  end

  def for_letters(letters)
    letters = letters.map { |l| l.downcase }.sort
    words.select do |word|
      word_can_be_made(word, letters)
    end
  end

  def for_letters_with(letters, required)
    letters << required
    possible = for_letters(letters)
    with_required(possible, required)
  end

  def get_letter_combos(word, letters)
    letters.combination(word.length).to_a
  end

  def can_make_word?(word, letter_combos)
    letter_combos.any? do |match|
      match = match.join('')
      match == word
    end
  end

  def word_can_be_made(word, letters)
    letter_combos = get_letter_combos(word, letters)
    word = word.chars.sort.join
    can_make_word?(word, letter_combos)
  end

  def with_required(possible, required)
    possible.keep_if do |word|
      word.include?(required)
    end
  end
end
