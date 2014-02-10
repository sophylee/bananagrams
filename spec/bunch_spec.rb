require 'rspec'
require 'bunch'
require 'player'

describe Bunch do 
  
  describe "::all_tiles" do 
    subject(:all_tiles) { Bunch.all_tiles }

    its(:count) { should == 144 }

    let(:letter_frequencies) do
      { :J => 2,
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
    end

    it "should have the right number of each letter" do
      letter_frequencies.all? do |letter, freq|
        all_tiles.select { |tile| tile == letter }.count == freq
      end
    end
  end

  let(:dog_tiles) { [Tile.new(:A), Tile.new(:B), Tile.new(:C)] }
  let(:gum_tiles) { [Tile.new(:D), Tile.new(:E), Tile.new(:F)] }
  let(:jill_tiles) { [Tile.new(:G), Tile.new(:H), Tile.new(:I)] }
  let(:pool_tiles) { [Tile.new(:J), Tile.new(:K), Tile.new(:L)] }
  let(:dumped_tiles) { [Tile.new(:M), Tile.new(:N), Tile.new(:O)] }
  let(:stock_bunch) { Bunch.new }
  let(:special_bunch) { Bunch.new(gum_tiles) }
  let(:player_jill) { Player.new("Jill", 3, jill_tiles) }

  describe "#initialize" do 
    it "starts off with 144 tiles" do 
      expect(stock_bunch.count).to eq(144)
    end

    it "can be initialized with an array of tiles" do
      expect(special_bunch.count).to eq(3)
    end
  end

  let(:bunch) { Bunch.new(pool_tiles) }

  it "does not expose its tiles directly" do
    expect(bunch).not_to respond_to(:tiles)
  end

  describe "#take" do 

    it "removes only one tile from the bunch" do
      stock_bunch.take(1)
      expect(stock_bunch.count).to eq(143)
    end

    it "when bunch is empty, it corrects for the number of tiles to take" do 
      bunch.take(4)
      expect(bunch.count).to eq(0)
    end

  end

  describe "#return" do
    it "returns the right number of tiles to the bunch" do 
      special_bunch.return(dumped_tiles)
      expect(special_bunch.count).to eq(6)
    end

    it "does not destroy the dumped tiles" do
      dumped_dup = dumped_tiles.dup 
      bunch.return(dumped_dup)
      expect(dumped_dup.count).to eq(dumped_tiles.count)
    end
  end

  before(:each) do 
    player_1.hand.pick_up(1, bunch)
    player_2.hand.pick_up(1, bunch)
  end
  let(:player_1) { Player.new("Sophy", 1, sample_hand) }
  let(:j_tile) { Tile.new(:J) }
  let(:i_tile) { Tile.new(:I) }
  let(:f_tile) { Tile.new(:F) }
  let(:sample_hand) { Hand.new([j_tile, i_tile, f_tile]) }
  let(:player_2) { Player.new("Katie", 2, another_hand) }
  let(:w_tile) { Tile.new(:W) }
  let(:o_tile) { Tile.new(:O) }
  let(:n_tile) { Tile.new(:N) }
  let(:another_hand) { Hand.new([w_tile, o_tile, n_tile]) }
  
  describe "#peel" do

    it "adds one tile to player 1's hand" do 
      expect(player_1.hand.count).to eq(4)
    end

    it "removes player 1's new tile from the bunch" do
      expect do
        player_1.hand.none? { |tile| bunch.include?(tile) }
      end.to be_true
    end

    it "adds one tile to player 2's hand" do
      expect(player_2.hand.count).to eq(4)
    end

    it "removes player 2's new tile from the bunch" do
      expect do
        player_2.hand.none? { |tile| bunch.include?(tile) }
      end.to be_true
    end
  end
end