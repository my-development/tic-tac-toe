module TicTacToe
	class Board
		attr_accessor :grid
		attr_reader :cols, :rows

		def initialize(rows, cols)
			@rows = rows == 0 ? 3 : rows
			@cols = cols == 0 ? 3 : cols
			@total_cell = @rows * @cols
			build_board
		end

		def print_grid
			(0..(@rows - 1)).each do |r|
				print_column_head if r == 0
				print_horizontal_line
				items = "Row #{r+1} | "
				(0..(@cols -1)).each do |c|
					 items << @grid[r][c].marked_by << ' | '
				end
				#puts items.length
				puts items
			end
			print_horizontal_line
		end

		def is_full?(total_moves)
			return @total_cell > total_moves ? false : true
		end

		def outside?(row, col)
			return invaild_row?(row) || invaild_col?(col)
		end

		def build_board
			@grid = Array.new(@rows){Array.new(@cols)}
			initalize_grid
		end
private
		def initalize_grid
			(0..(@rows - 1)).each do |r|
				(0..(@cols -1)).each do |c|
					@grid[r][c] = Cell.new(r,c)
				end
			end
		end

		def print_column_head
			line = 'Column ' #empty space at begin
			(0..(@cols -1)).each do |c|
				line << " #{c + 1}" << '  '
			end
			puts line
		end

		def print_horizontal_line
			line = ' ' * 6 #empty space at begin each row
			line << '=' * (@cols * 4 + 1)
			puts line
		end

		def invaild_row?(row)
			return row >= @rows || row < 0
		end

		def invaild_col?(col)
			return col >= @cols || col < 0
		end
	end
end