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

  def from_file(file_location)
    File.open(file_location).each do |line|
      line = line.strip
      @phrase = line.to_s
    end
    eng_to_cypher(@phrase, -3)
  end

  def eng_to_cypher(phrase, rotation)
    cypher(rotation)
    phrase_array = phrase.downcase.chars
    # binding.pry
    thing = phrase_array.map do |char|
      one_letter(char)
      # binding.pry
    end.compact.join
  end

  def cypher_to_eng(phrase)
    inverted = @character_hash.invert
    phrase.chars.map do |char|
      inverted[char]
    end.compact.join
  end
end
