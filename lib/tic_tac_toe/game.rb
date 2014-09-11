module TicTacToe
	HORIZONTAL = 'H'
	VERTICAL = 'V'
	UPPER_LEFT = 'UL'
	UPPER_RIGHT = 'UR'
	DIRECTION_UP = 'up'
	DIRECTION_DOWN = 'down'

	class Game
		attr_accessor :board


		def initialize(rows, cols)
		   @board = Board.new(rows, cols)
		   @winning_connection = 3
		   @first_player = nil
		   @second_player = nil
		   @rows = rows
		   @cols = cols
		   print_game
		end

		def set_players(first_player, second_player)
			@first_player = first_player
			@second_player = second_player
		end

		def start
			total_moves = 0
			count = 1
			interrupted = false
			Signal.trap("SIGINT") { 
				interrupted = true
				exit!
			} 
			while !interrupted
				
				player = count.odd? ? @first_player : @second_player

				player_input = wait_for_move(player)
				puts ' ' * 50
				if player_input.empty?
					puts 'Please input correct row and column, for example: 1,1'
				else 
					row, col = split_row_col(player_input)
					if valid_row_col?(row, col)	
						cell = @board.grid[row][col]
						player.make_move(cell)
						count += 1
						total_moves = @first_player.number_of_moves + @second_player.number_of_moves
						interrupted = win?(player, row, col)
						unless interrupted
							interrupted = @board.is_full?(total_moves)
							puts 'It is draw!' if interrupted
						end
						print_game
					end
				end
			end
		end

		def reset_game
			@board.build_board
			print_game
		end

private
		def win?(player, row, col)
			flags = %W(#{HORIZONTAL} #{VERTICAL} #{UPPER_LEFT} #{UPPER_RIGHT})
			direction_flag = %W(#{DIRECTION_UP} #{DIRECTION_DOWN})
			
			flags.each do |f|
				number_connect = 0
				direction_flag.each do |d|
					number_connect += number_connect_from(player, row, col, f, d)
				end
			#	number_connect = number_connect_from(player, row, col, f) + number_connect_from(player, row, col, f)
				if number_connect > @winning_connection #must greater than since the start point is computed from two different part
					puts "Hi #{player.name}, you win!!!!!"
					return true
					break
				end
			end
			return false 
		end


		def number_connect_from(player, row, col, flag, direction_flag)
			number_of_my_cell = 1
			cell = @board.grid[row][col]
			next_row, next_col = next_cell(cell, direction_flag, flag)
			return number_of_my_cell if @board.outside?(next_row, next_col)
			return number_of_my_cell unless @board.grid[next_row][next_col].marked_by_me?(player.mark)
			return number_of_my_cell + number_connect_from(player, next_row, next_col, flag, direction_flag)
		end

		def next_cell(cell, direction_flag, flag)
			case direction_flag
			when DIRECTION_DOWN
				return case flag
				when VERTICAL
					cell.down
				when HORIZONTAL
					cell.right
				when UPPER_LEFT
					cell.down_right
				when UPPER_RIGHT
					cell.down_left
				end
			when DIRECTION_UP
				return case flag
				when VERTICAL
					cell.up
				when HORIZONTAL
					cell.left
				when UPPER_LEFT
					cell.up_left
				when UPPER_RIGHT
					cell.up_right
				end
			else
				return -1, -1 #return invalid cell
			end
		end

		def valid_row_col?(row, col)
			if @board.outside?(row, col)
				puts "#{row + 1} * #{col + 1} is outside the board"
				return false
			end
			if @board.grid[row][col].is_marked?
				puts "#{row + 1} * #{col + 1} is taken, please choose different row and column"
				return false
			end
			return true
		end

		def split_row_col(str)
			param = str.split(',')
			return -1, -1 if param.count != 2
			return param[0].to_i - 1, param[1].to_i - 1  #minus one from the row and col
		end

		def wait_for_move(player)
			puts "Hi #{player.name}, please choose as (row,column) OR Press Ctrl-C to exit >"
			return $stdin.gets.chomp
		end

		def move(player, cell)
			cell.choose(player.name, player.mark)
			player.make_move
		end

		def print_game
			@board.print_grid
		end

	end
end