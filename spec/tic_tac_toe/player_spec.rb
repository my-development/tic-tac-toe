require 'spec_helper'

describe TicTacToe::Player do
	let(:player) {Player.new('name', 'mark')}
	let(:cell) {Cell.new(1,1)}

	it '.make_move' do
		player.make_move(cell)
		expect(player.number_of_moves).to eq(1)
	end

	it '.reset_moves_count' do
		player.reset_moves_count
		expect(player.number_of_moves).to eq(0)
	end

end