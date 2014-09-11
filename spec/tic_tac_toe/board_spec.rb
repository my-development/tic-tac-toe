require 'spec_helper'

describe TicTacToe::Board do 
	let(:board) {Board.new(3,3)}

	it '.is_full?' do
		expect(board.is_full?(7)).to be false
		expect(board.is_full?(9)).to be true
		expect(board.is_full?(10)).to be true
	end

	it '.outside?' do
		expect(board.outside?(1,1)).to be false
		expect(board.outside?(3,4)).to be true
		expect(board.outside?(4,3)).to be true
	end

	it '.build_board' do
		expect(board.rows).to eq(3)
		expect(board.cols).to eq(3)
		expect(board.grid.count).to eq(3)
		expect(board.grid[0][0]).to be_instance_of Cell
	end
	
end