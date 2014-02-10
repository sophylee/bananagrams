require 'rspec'

describe Tile do

	subject(:tile) { Tile.new(:T) }

	describe "#initialize" do
		it "should have a letter value" do
			expect(tile.letter).to be(:T)
		end
	end

end