$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'tic_tac_toe'
include TicTacToe

rows = ARGV[0].to_i
cols = ARGV[1].to_i

puts "You want to setup #{rows} X #{cols} board to play."
game = Game.new(rows,cols)

puts 'First player name >'
first_player_name = $stdin.gets.chomp

puts "Hi #{first_player_name}, Welcome to play."

puts '-' * 50

puts 'Second player name >'
second_player_name = $stdin.gets.chomp
puts "Hi #{second_player_name}, Welcome to play."

puts '-' * 50

first_player = Player.new(first_player_name, 'X')
second_player = Player.new(second_player_name, 'O')

end_game = false

game.set_players(first_player, second_player)
#game.start

while !end_game
	game.start
	puts 'Play again? Y/N'
	answer = $stdin.gets.chomp
	if answer.downcase == 'y'
		first_player.reset_moves_count
		second_player.reset_moves_count
		game.reset_game
	else
		end_game = true
	end
end



