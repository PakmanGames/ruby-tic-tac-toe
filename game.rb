require_relative './board'
require_relative './player'

class Game
  def initalize
    player_x = Player.create_player('X')
    player_o = Player.create_player('O')
    board = Board.new
  end
end
