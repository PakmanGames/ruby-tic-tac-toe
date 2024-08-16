class Player
  attr_reader :name, :shape

  def initialize(name, shape)
    @name = name
    @shape = shape
  end

  def self.create_player(shape)
    puts "What's your name?"
    name = gets.chomp
    Player.new(name, shape)
  end
end