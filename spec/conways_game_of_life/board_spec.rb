require "spec_helper"
require "conways_game_of_life/board"
require "pry"

RSpec.describe Board do
  let!(:board) { Board.new }

  it "initializes new board objects properly" do
    expect(board.rows).to eq(3)
    expect(board.cols).to eq(3)
    expect(board.live_cells).to eq([])
    expect(board.dead_cells).to eq(board.cells)
  end

  it "generates a random board with alive and dead cells" do
    board.random_generator
    expect(board.live_cells).to_not eq([])
    expect(board.dead_cells).to_not eq(board.cells)
  end

end
