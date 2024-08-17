class Board
  attr_accessor :board

  @@WINNING_INDEXES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 5, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    output = "----------\n"
    board.each_with_index do |item, index|
      output += ((index + 1) % 3).zero? ? "#{item} \n----------\n" : "#{item} | "
    end
    output
  end

  def change_tile(location, shape)
    board[location - 1] = shape
  end

  def find_winner
    @@WINNING_INDEXES.each do |indexes|
      a, b, c = indexes
      return board[a] if board[a] == board[b] && board[b] == board[c]
    end
    nil
  end

  def draw?
    board.all? { |element| %w[X O].include?(element) }
  end
end

# for testing

# board = Board.new
# puts board.display_board
# board.board[0] = 'X'
# board.board[1] = 'X'
# board.board[2] = 'X'

# puts board.display_board
# puts board.find_winner
