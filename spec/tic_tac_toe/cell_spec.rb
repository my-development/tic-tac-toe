require 'spec_helper'


describe TicTacToe::Cell do
 	
 	let(:cell) {Cell.new(2,2)}
 	
	context 'move' do
		it '#up' do
			row, col = cell.up
			expect(row).to eq(1)
			expect(col).to eq(2)
		end

		it '#down' do
			row, col = cell.down
			expect(row).to eq(3)
			expect(col).to eq(2)
		end

		it '#left' do
			row, col = cell.left
			expect(row).to eq(2)
			expect(col).to eq(1)
		end

		it '#right' do
			row, col = cell.right
			expect(row).to eq(2)
			expect(col).to eq(3)
		end

		it '#up_right' do
			row, col = cell.up_right
			expect(row).to eq(1)
			expect(col).to eq(3)
		end

		it '#up_left' do
			row, col = cell.up_left
			expect(row).to eq(1)
			expect(col).to eq(1)
		end

		it '#down_right' do
			row, col = cell.down_right
			expect(row).to eq(3)
			expect(col).to eq(3)
		end

		it '#down_left' do
			row, col = cell.down_left
			expect(row).to eq(3)
			expect(col).to eq(1)
		end

	end

	context 'action' do
		before :each do
			cell.choose('name', 'mark')
		end
		it '.choose' do
			expect(cell.play_name).to eq('name')
			expect(cell.marked_by).to eq('mark')
		end

		it '.is_marked?' do
			expect(cell.is_marked?).to be true
		end

		it '.marked_by_me?' do
			expect(cell.marked_by_me?('mark')).to be true
			expect(cell.marked_by_me?('mark1')).to be false
		end

	end

end
