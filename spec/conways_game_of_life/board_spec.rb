require "spec_helper"
require "conways_game_of_life/board"

RSpec.describe Board do
  let!(:board) { Board.new }

  it "initializes new board objects properly" do
    expect(board.rows).to eq(3)
    expect(board.cols).to eq(3)
    expect(board.live_cells).to eq([])
    expect(board.dead_cells).to eq(board.cells)
  end

end
