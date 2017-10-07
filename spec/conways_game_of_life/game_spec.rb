require 'spec_helper'
require 'conways_game_of_life/game'

RSpec.describe Game do
  let!(:game) { Game.new }
  it 'initializes new cell objects properly' do
    #
  end

  it 'generates a random board with alive and dead cells' do
    game.random_generator
    expect(game.board.live_cells).to_not eq([])
    expect(game.board.dead_cells).to_not eq(game.board.cells)
  end
end
