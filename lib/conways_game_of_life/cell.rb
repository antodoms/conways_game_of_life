class Cell

  # Cell is the smallest component in the game and has a
  # x,y coordinate and a value. A board has many cells
  # and Cells belongs to a board.

  # Value = true means the cell is alive
  # Value = false means the cell is dead

  attr_accessor :x, :y, :value
  
  def initialize(x=0, y=0)
    @x = x
    @y = y
    @value = true
  end

  def die!
    @value = false
  end

  def revive!
    @value = true
  end
end