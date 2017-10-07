require 'spec_helper'
require 'conways_game_of_life/board'
require 'pry'

RSpec.describe Board do
  let!(:board) { Board.new }

  it 'initializes new board objects properly' do
    expect(board.rows).to eq(3)
    expect(board.cols).to eq(3)
    expect(board.live_cells).to eq([])
    expect(board.dead_cells).to eq(board.cells)
  end

  it 'returns the list of all neighbouring cells for that cell' do
    board.set_cell(0, 1, true)
    board.set_cell(1, 0, true)

    expect(board.get_neighbors(board.get_cell(0, 0)).size).to eq(3)
    expect(board.get_neighbors(board.get_cell(0, 0))).to \
      eq([board.get_cell(1, 0), board.get_cell(1, 1), board.get_cell(0, 1)])
  end

  it 'returns the list of all live neighbouring cells for that cell' do
    board.set_cell(0, 1, true)
    board.set_cell(1, 0, true)

    expect(board.get_live_neighbours(board.get_cell(0, 0)).size).to eq(2)
    expect(board.get_live_neighbours(board.get_cell(0, 0))).to \
      eq([board.get_cell(1, 0), board.get_cell(0, 1)])
  end

  it 'returns the list of all dead neighbouring cells for that cell' do
    board.set_cell(0, 1, true)
    board.set_cell(1, 0, true)

    expect(board.get_dead_neighbours(board.get_cell(0, 0)).size).to eq(1)
    expect(board.get_dead_neighbours(board.get_cell(0, 0))).to \
      eq([board.get_cell(1, 1)])
  end
end
