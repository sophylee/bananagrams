require 'rspec'
require 'player'

describe Player do 

  subject(:player_1) { Player.new("Sophy", 1, sample_hand) }
  let(:j_tile) { Tile.new(:J) }
  let(:i_tile) { Tile.new(:I) }
  let(:f_tile) { Tile.new(:F) }
  let(:sample_hand) { Hand.new([j_tile, i_tile, f_tile]) }

  describe "#initialize" do 
    it "creates a player with name 'Sophy'" do 
      expect(player_1.name).to eq("Sophy")
    end

    it "assigns a player number to the player" do 
      expect(player_1.num).to eq(1)
    end
  end
end