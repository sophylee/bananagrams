class Tile
  LETTER_FREQ = { 
    :J => 2,
    :K => 2, 
    :Q => 2, 
    :X => 2, 
    :Z => 2, 
    :B => 3, 
    :C => 3, 
    :F => 3, 
    :H => 3, 
    :M => 3, 
    :P => 3, 
    :V => 3,
    :W => 3, 
    :Y => 3,
    :G => 4,
    :L => 5,
    :D => 6, 
    :S => 6, 
    :U => 6,
    :N => 8, 
    :T => 9, 
    :R => 9,
    :O => 11,
    :I => 12,
    :A => 13, 
    :E => 18 
  }

  def self.letters
    LETTER_FREQ
  end

  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

end