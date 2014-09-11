module TicTacToe
	class Player
		attr_accessor :name, :mark
		attr_reader :number_of_moves

		def initialize(name, mark)
			@name = name
			@mark = mark
			reset_moves_count
		end

		def make_move(cell)
			cell.choose(@name, @mark)
			@number_of_moves += 1
		end

		def reset_moves_count
			@number_of_moves = 0
		end
	end
end