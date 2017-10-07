class Board

  # A Game can have multiple boards with each ticks. 
  # A Board has @rows,@cols 2D Array of cells.

  attr_accessor :rows, :cols, :cells

  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
    @cells = []

    0..rows do |x|
      0..cols do |y|
        @cells << Cell.new(x, y)
      end
    end
  end

  def live_cells
    cells.select { |cell| cell.alive }
  end

  def dead_cells
    cells.select { |cell| cell.dead }
  end

end