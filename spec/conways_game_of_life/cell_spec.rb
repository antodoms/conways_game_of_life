require "spec_helper"
require "conways_game_of_life/cell"

RSpec.describe Cell do
  let!(:cell) { Cell.new }

  it "initializes new cell objects properly" do
  	expect(cell.value).to eq(false)
  	expect(cell.x).to eq(0)
  	expect(cell.y).to eq(0)
  end

  it "alive? returns false if the cell is dead" do
  	cell.die!
  	expect(cell.alive?).to eq(false)
  end

  it "alive? returns true if the cell is revived" do
  	cell.revive!
  	expect(cell.alive?).to eq(true)
  end

  it "dead? returns true if cell is dead" do
  	cell.die!
  	expect(cell.dead?).to eq(true)
  end

  it "dead? returns false if cell is alive" do
  	cell.revive!
  	expect(cell.dead?).to eq(false)
  end


end
