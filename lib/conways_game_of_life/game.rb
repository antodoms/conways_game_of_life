class Game
  attr_accessor :board

  # A Game will have multiple boards
  
  def initialize(board=Board.new)
    @board = board
  end
  
  def tick!
  end
end