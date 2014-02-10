require 'rspec'
require 'board'
require 'tile'
require 'player'
require 'hand'

describe Board do
	subject(:board) { Board.new }

	it "contains a board with 20 rows" do 
		expect(board.rows.count).to eq(20)
	end

	it "contains a board with 55 columns" do 
		expect(board.rows.first.count).to eq(55)
	end

	describe "#initialize" do

		it "creates a board with nil in each potential tile location" do
			expect do
				board.rows.all? { |blank| blank.nil? }
			end.to be_true
		end

	end

	describe "#render" do 

		it "should display the bunch in the center of the board" do
			pending("finish")
		end

		it "should correctly display a large bunch" do
			pending("finish")
		end

		it "should correctly display a small bunch" do
			pending("finish")
		end

	end

	describe "#place_tile" do

		let(:j_tile) { Tile.new(:J) }
		let(:i_tile) { Tile.new(:I) }
		let(:f_tile) { Tile.new(:F) }
		let(:sample_hand) { Hand.new([j_tile, i_tile, f_tile]) }
		let(:first_location) { [3, 4] }
		let(:divider_location) { [3, 26] }
		let(:player_1_location) { [7, 14] }
		let(:player_2_location) { [13, 41] }
		let(:player_1) { Player.new("Sophy", 1, sample_hand) }
		let(:player_2) { Player.new("Katie", 2, sample_hand) }

		it "adds a tile to the player 1 board" do
			board.place_tile(first_location, j_tile, player_1)
			expect(board[first_location].letter).to eq(:J)
		end

		it "cannot add a tile to the center divider" do 
			expect do 
				board.place_tile(divider_location, j_tile, player_1)
			end.to raise_error("Cannot place a tile on the divider.")
		end

		it "does not allow player 1 to add a tile to player 2's board" do
			expect do 
				board.place_tile(player_2_location, j_tile, player_1)
			end.to raise_error("Player 1 cannot invade Player 2's space.")
		end

		it "does not allow player 2 to add a tile to player 1's board" do 
			expect do 
				board.place_tile(player_1_location, j_tile, player_2)
			end.to raise_error("Player 2 cannot invade Player 1's space.")
		end

		it "removes the tile from the player's hand" do 
			board.place_tile(player_1_location, j_tile, player_1)
			expect(player_1.hand.count).to eq(2)
		end

	end


end
