require_relative 'hand'

class Player

  attr_accessor :hand
  attr_reader :name, :num

  def initialize(name, num, hand)
    @name, @num, @hand = name, num, hand
  end

end