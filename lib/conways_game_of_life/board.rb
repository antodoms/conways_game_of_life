class Board

  # A Game can have multiple boards with each ticks. 
  # A Board has @rows,@cols 2D Array of cells.
  
  attr_accessor :rows, :cols, :cells

  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
    @cells = []
  end

end