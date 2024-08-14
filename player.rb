class Player
  attr_reader :shape

  def initialize(game, shape)
    @game = game
    @shape = shape
  end

end