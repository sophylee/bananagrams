require 'rspec'
require 'hand'
require 'tile'

describe Hand do 
	let(:b_tile) { Tile.new(:B) }
	let(:i_tile) { Tile.new(:I) }
	let(:k_tile) { Tile.new(:K) }
	let(:e_tile) { Tile.new(:E) }
	let(:bunch) { Bunch.new }
	subject(:hand) { Hand.new([b_tile, i_tile, k_tile, e_tile]) }

	it "should have five tiles" do
		expect(hand.count).to eq(4)
	end

	describe "#initialize" do
		it "should create a hand with an array of tiles" do
			expect(hand.tiles).to be_an(Array) 
		end
	end

	describe "#peel" do 
		before(:each) { hand.peel(bunch) }
		it "should add one tile from the bunch to the player's hand" do
			expect(hand.count).to eq(5)
		end

		it "should remove one tile from the bunch" do
			expect(bunch.count).to eq(143)
		end
	end

	describe "#dump" do
		before(:each) { hand.dump(b_tile, bunch) }
		it "should remove one tile and add three tiles to the player's hand" do
			expect(hand.count).to eq(6)
		end

		it "should get rid of the dumped tile from the player's hand" do
			expect(hand.tiles.include?(b_tile)).to be_false
		end

		it "should remove three tiles and add one tile to the bunch" do
			expect(bunch.count).to eq(142)
		end

		# including this test causes another test ensuring that bunch does not
		# expose its tiles to break; to make this test pass, add tiles as an 
		# attr_accessor to bunch temporarily
		# it "should add the dumped tile back to the bunch" do
		# 	expect(bunch.tiles.include?(b_tile)).to be_true
		# end
	end

end