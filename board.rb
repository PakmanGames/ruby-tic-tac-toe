# frozen_string_literal: true

# Board object which represents the game board
class Board
  attr_accessor :board

  # Different winning combinations
  @@WINNING_INDEXES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # Neatly outputs board in the console
  def display_board
    output = "----------\n"
    board.each_with_index do |item, index|
      output += ((index + 1) % 3).zero? ? "#{item} \n----------\n" : "#{item} | "
    end
    output
  end

  # Changes the tile to the shape passed to it
  def change_tile(shape)
    location = String.new
    locations = board.dup
    # Filters to only display available slots
    locations.select! { |element| element != 'X' && element != 'O' }
    # Repeatedly asks until user enters a valid location
    until locations.include?(location.to_i)
      puts 'Enter the spot you want to place your shape:'
      puts "These are the available locations: #{locations}"
      location = gets.chomp
    end
    board[location.to_i - 1] = shape
  end

  # Checks for a winner based on the different winning index combinations
  def find_winner
    @@WINNING_INDEXES.each do |indexes|
      a, b, c = indexes
      return board[a] if board[a] == board[b] && board[b] == board[c]
    end
    nil
  end

  # Determines whether it's a draw
  def draw?
    board.all? { |element| %w[X O].include?(element) }
  end
end
