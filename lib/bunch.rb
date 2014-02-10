require_relative 'tile'

class Bunch

  def self.all_tiles
    all_tiles = []

    Tile.letters.each do |letter, freq|
      count = 0
      until count == freq
        all_tiles << Tile.new(letter)
        count += 1
      end
    end

    all_tiles
  end

  def initialize(tiles = Bunch.all_tiles)
    @tiles = tiles
  end

  def count
    @tiles.count
  end

  def take(n)
    @tiles.shuffle
    if n > count
      removed_tiles = @tiles.shift(count)
    else
      removed_tiles = @tiles.shift(n)
    end
  end

  def return(dumped_tiles)
    dumped_tiles.each { |tile| @tiles << tile }
  end

end

# b = Bunch.new([Tile.new(:D), Tile.new(:O), Tile.new(:G)])
# puts b.count