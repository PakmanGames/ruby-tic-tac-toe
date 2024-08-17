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

  def play_game
    play_round until board.draw? || board.find_winner
    if board.draw?
      puts "Game ends in a draw at round #{round - 1}!"
    elsif board.find_winner == 'X' || board.find_winner == 'O'
      winner = board.find_winner == 'X' ? player_x : player_o
      puts "The winner is #{winner.name} (#{winner.shape})! Victory on round #{round - 1}"
    end
  end

  def play_round
    puts "Round: #{round}"
    puts board.display_board
    if (round % 2).zero?
      puts "#{player_o.name}'s turn (#{player_o.shape})"
      current = player_o.shape
    else
      puts "#{player_x.name}'s turn (#{player_x.shape})"
      current = player_x.shape
    end

    self.round += 1
    board.change_tile(current)
  end
end
