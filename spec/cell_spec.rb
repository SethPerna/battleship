require './lib/ship'
require './lib/cell'


RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
  end

  it "exists" do
    expect(@cell).to be_an_instance_of(Cell)
    expect(@cell.coordinate).to eq("B4")
  end

  it "checks if there is a ship" do
    expect(@cell.ship).to be nil
  end

  it "checks if the space is empty" do
    expect(@cell.empty?).to be true
  end

  before :each do
      @cruiser = Ship.new("Cruiser", 3)
    end

      it "checks if a ship exists" do
        expect(@cruiser).to be_an_instance_of(Ship)
      end
end
