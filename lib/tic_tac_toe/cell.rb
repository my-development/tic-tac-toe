module TicTacToe
	class Cell
		attr_accessor :col, :row, :marked_by, :play_name
		
		def initialize(row, col)
			@col = col
			@row = row
			@marked_by = ' '
			@play_name = ''
		end

		def up
		 	return @row - 1, @col
		end

		def down
		  	return @row + 1, @col
		end

		def left
			return @row, @col - 1
		end

		def right
			return @row, @col + 1
		end

		def up_right
			return @row - 1, @col + 1
		end

		def up_left
			return @row - 1, @col - 1
		end

		def down_right
			return @row + 1, @col + 1
		end

		def down_left
			return @row + 1, @col - 1
		end

		def choose(name, mark)
			@play_name = name
			@marked_by = mark
		end

		def is_marked?
			return !@play_name.empty?
		end

		def marked_by_me?(symbol)
			return @marked_by == symbol
		end
	end
end