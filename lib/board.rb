require 'colorize'

class Board 

	PLAYER_1_COLS = Array (0..24)
	SEPARATOR_COLS = Array (25..29)
	PLAYER_2_COLS = Array (30..54)

	attr_accessor :rows

	def initialize
		@rows = Array.new(20) { Array.new(55) }
	end

	def []location
		row, col = location
		@rows[row][col]
	end

	def []=(location, tile)
		row, col = location
		@rows[row][col] = tile
	end

	def render
		@rows.each_with_index do |row, row_idx|
			row.each_with_index do |col, col_idx|
				if PLAYER_1_COLS.include?(col_idx) && (row_idx + col_idx).even?
					print "  ".colorize( :background => :light_white )
				elsif PLAYER_1_COLS.include?(col_idx) && (row_idx + col_idx).odd?
					print "  ".colorize( :background => :white )
				elsif PLAYER_2_COLS.include?(col_idx) && (row_idx + col_idx).even?
					print "  ".colorize( :background => :light_white )
				elsif PLAYER_2_COLS.include?(col_idx) && (row_idx + col_idx).odd?
					print "  ".colorize( :background => :white )
				else
					print "  ".colorize( :background => :light_red )
				end
			end
			print "\n"
		end
	end

	def place_tile(location, tile, player)
		if SEPARATOR_COLS.include?(location[1])
			raise "Cannot place a tile on the divider."
		elsif player.num == 1 && PLAYER_2_COLS.include?(location[1])
			raise "Player 1 cannot invade Player 2's space."
		elsif player.num == 2 && PLAYER_1_COLS.include?(location[1])
			raise "Player 2 cannot invade Player 1's space."
		else
			self[location] = tile
			player.hand.delete(tile)
		end
	end

end

Board.new.render