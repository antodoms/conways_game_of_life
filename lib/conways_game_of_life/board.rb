class Board

  # A Game can have multiple boards with each ticks. 
  # A Board has @rows,@cols 2D Array of cells.

  attr_accessor :rows, :cols, :cells, :cells_dictionary

  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
    @cells = []
    @cells_dictionary = {}

    for x in 0..rows do
      @cells_dictionary[x] ||= {}
      for y in 0..rows do
        cell = Cell.new(x, y)
        
        @cells_dictionary[x][y] = cell 
        @cells << cell
      end
    end
  end

  def set_cell(x,y,value)
    cells_dictionary[x][y].setvalue(value)
  end

  def get_cell(x,y)
    cells_dictionary[x][y]
  end

  def get_neighbors(cell)
    neighbours = []

    # Neighbours to the North-West
    if cell.y > 0 and cell.x > 0
      neighbours << self.cells_dictionary[cell.y - 1][cell.x - 1]
    end
    
    # Neighbour to the North
    if cell.y > 0
      neighbours << self.cells_dictionary[cell.y - 1][cell.x]
    end

    # Neighbour to the North-East
    if cell.y > 0 and cell.x < (cols - 1)
      neighbours << self.cells_dictionary[cell.y - 1][cell.x + 1]
    end

    # Neighbours to the South-West
    if cell.y < (rows - 1) and cell.x > 0
      neighbours << self.cells_dictionary[cell.y + 1][cell.x - 1]
    end

    # Neighbour to the South
    if cell.y < (rows - 1)
      neighbours << self.cells_dictionary[cell.y + 1][cell.x]
    end

    # Neighbour to the South-East
    if cell.y < (rows - 1) and cell.x < (cols - 1)
      neighbours << self.cells_dictionary[cell.y + 1][cell.x + 1]
    end

    # Neighbour to the East
    if cell.x < (cols - 1)
      neighbours << self.cells_dictionary[cell.y][cell.x + 1]
    end
    # Neighbours to the West
    if cell.x > 0
      neighbours << self.cells_dictionary[cell.y][cell.x - 1]
    end

    neighbours
  end

  def get_live_neighbours(cell)
    get_neighbors(cell).select {|cell| cell.alive? }
  end


  def get_dead_neighbours(cell)
    get_neighbors(cell).select {|cell| cell.dead? }
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