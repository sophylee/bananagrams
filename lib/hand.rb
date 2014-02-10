require_relative 'tile'
require_relative 'bunch'

class Hand

  def self.draw_from(bunch)
    Hand.new(bunch.take(21))
  end

  attr_accessor :tiles

  def initialize(tiles)
    @tiles = tiles
  end

  def count
    @tiles.count
  end

  def peel(bunch)
    pick_up(1, bunch)
  end

  def dump(tile, bunch)
    drop(tile, bunch)
    pick_up(3, bunch)
  end

  def delete(tile)
    @tiles.delete(tile)
  end

  def push(tile_arr)
    @tiles.concat(tile_arr)
  end

  def pick_up(n, bunch)
    @tiles.concat(bunch.take(n))
  end

  def drop(tile, bunch)
    bunch.return([tile])
    tiles.delete(tile)
  end
end