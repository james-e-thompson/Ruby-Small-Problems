class Anagram
  def initialize(word)
    @word = word
  end
  
  def match(candidates)
    candidates.select do |other_word|
      @word.downcase != other_word.downcase &&
      @word.downcase.split('').sort == other_word.downcase.split('').sort
    end
  end
end