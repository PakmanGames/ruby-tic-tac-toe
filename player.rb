# frozen_string_literal: true

# Player object which contains name and shape (X or O)
class Player
  attr_reader :name, :shape

  def initialize(name, shape)
    @name = name
    @shape = shape
  end

  # Class method to create a new player instance
  def self.create_player(shape)
    puts "What's the name of player #{shape}?"
    name = gets.chomp
    Player.new(name, shape)
  end
end
