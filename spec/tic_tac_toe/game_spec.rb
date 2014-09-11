require 'spec_helper'


describe TicTacToe::Game do 

	let(:game) {Game.new(3,3)}
	#let(:first_player) {Player.new('first_player', 'X')}
	#let(:second_player) {Player.new('second_player', 'O')}
	
	xit 'game has a board object' do
		expect(game.board).to be_instance_of Board
	end
end