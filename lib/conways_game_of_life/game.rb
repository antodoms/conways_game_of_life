# A Game will have multiple boards
class Game
  attr_accessor :board
  attr_reader :board_list

  def initialize(board = Board.new)
    @board = board
  end

  def tick!
    new_board = Board.new(board.rows, board.cols, board.live_cells)

    new_board.cells.each do |cell|
      neighbours_count = board.get_live_neighbours_count(cell)

      # Rule 1:
      # Any live cell with fewer than two live neighbours dies, as
      # if caused by underpopulation.
      cell.die! if cell.alive? && neighbours_count < 2

      # Rule 2:
      # Any live cell with two or three live neighbours lives on to
      # the next generation.
      cell.revive! if cell.alive? && ([2, 3].include? neighbours_count)

      # Rule 3:
      # Any live cell with more than three live neighbours dies,
      # as if by overpopulation.
      cell.die! if cell.alive? && neighbours_count > 3

      # Rule 4:
      # Any dead cell with exactly three live neighbours becomes a
      # live cell, as if by reproduction.
      cell.revive! if cell.dead? && neighbours_count == 3
    end

    @board = new_board
  end

  def print_board_console
    puts "\n\n No of Live Cells = #{board.live_cells.count}"
    (0..(board.rows - 1)).each do |row|
      value_to_print = ""
      (0..(board.cols - 1)).each do |col|
        value_to_print << "#{ board.get_cell(row, col).value ? '@' : '.' }"
      end
      puts value_to_print
    end
  end

  def random_generator
    board.cells.each do |cell|
      cell.value = [true, false].sample
    end
  end

  def manual_generator(cells)
  	board.cells.each do |cell| cell.die!; end

    cells.each do |cell|
      board.set_cell(cell[0], cell[1], true)
    end
  end

  def can_play
  	board.live_cells.count.zero?
  end
end
