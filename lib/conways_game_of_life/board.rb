class Board

  # A Game can have multiple boards with each ticks. 
  # A Board has @rows,@cols 2D Array of cells.

  attr_accessor :rows, :cols, :cells

  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
    @cells = []

    for x in 0..rows do
      for y in 0..rows do
        @cells << Cell.new(x, y)
      end
    end
  end

  def live_cells
    cells.select { |cell| cell.alive? }
  end

  def dead_cells
    cells.select { |cell| cell.dead? }
  end

  def random_generator
    cells.each do |cell|
      cell.value = [true, false].sample
    end
  end

end