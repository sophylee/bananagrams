require_relative 'player'
require_relative 'bunch'

class Game

	attr_reader :player_1, :player_2

	def initialize(player_1_name, player_2_name)
		bunch = Bunch.new
		@player_1 = Player.new(player_1_name, 1, Hand.draw_from(bunch))
		@player_2 = Player.new(player_2_name, 2, Hand.draw_from(bunch))
	end

end