require_relative './board'
require_relative './player'

class Game
  attr_accessor :round
  attr_reader :board, :player_x, :player_o

  def initialize
    @player_x = Player.create_player('X')
    @player_o = Player.create_player('O')
    @board = Board.new
    @round = 1
  end

  def start_game
    play_round until board.draw? || board.find_winner
  end

  def play_round
    location = String.new
    puts "Round: #{round}"
    puts board.display_board
    if (round % 2).zero?
      puts "#{player_o.name}'s turn (#{player_o.shape})"
      current = player_o.shape
    else
      puts "#{player_x.name}'s turn (#{player_x.shape})"
      current = player_x.shape
    end
    until [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(location.to_i)
      puts 'Enter the spot you want to place your shape (tiles 1 - 9 unless taken):'
      location = gets.chomp
    end
    self.round += 1
    board.change_tile(location.to_i, current)
  end
end

game = Game.new
game.start_game
