# frozen_string_literal: true

require_relative './board'
require_relative './player'

# Represents the game tic-tac-toe, utilizes other classes for certain elements
class Game
  attr_accessor :round
  attr_reader :board, :player_x, :player_o

  # Creates player and board objects which are required for game functionality
  def initialize
    @player_x = Player.create_player('X')
    @player_o = Player.create_player('O')
    @board = Board.new
    @round = 1
  end

  # Starts game and ends if there's a winner or ends in draw
  def play_game
    play_round until board.draw? || board.find_winner
    if board.draw?
      puts "Game ends in a draw at round #{round - 1}!"
    elsif board.find_winner == 'X' || board.find_winner == 'O'
      winner = board.find_winner == 'X' ? player_x : player_o
      puts "The winner is #{winner.name} (#{winner.shape})! Victory on round #{round - 1}"
    end
  end

  # Round logic to display board and determine which player's turn it is
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
