require 'rspec'
require 'game'

describe Game do 

	subject(:game) { Game.new("Sophy", "Katie") }

	describe "#initialize" do

		it "creates a game with a player 1 name Sophy" do
			expect(game.player_1.name).to eq("Sophy")
		end

		it "creates a game with another player, Katie" do
			expect(game.player_2.name).to eq("Katie")
		end

		it "distributes 21 tiles to player 1" do
			expect(game.player_1.hand.count).to eq(21)
		end

		it "distributes 21 tiles to player 2" do 
			expect(game.player_2.hand.count).to eq(21)
		end
	end

	describe "#play" do

		it "should loop through the game until a player wins" do
			pending("finish")
		end

		it "should display the name of the winner" do
			pending("finish")
		end

	end

end