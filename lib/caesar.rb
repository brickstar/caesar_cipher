class Caesar
  attr_reader :character_hash
  def initialize
    @characters = ("a".."z")
    @character_hash = {}
  end

  def rotate_characters(rotation)
    @characters.to_a.rotate(rotation)
  end

  def cypher(rotation)
    rotated = rotate_characters(rotation)
    @character_hash = Hash[@characters.zip(rotated)]
  end

  def one_letter(letter)
    @character_hash[letter]
  end

  def encrypt(phrase, rotation)
    cypher(rotation)
    phrase_array = phrase.downcase.chars
    binding.pry
    phrase_array.map do |char|
      one_letter(char)
    end.compact.join
  end
end
