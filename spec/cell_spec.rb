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

      it "checks if a ship is placed" do
        @cell.place_ship(@cruiser)
        expect(@cell.ship).to eq(@cruiser)
      end

      it "checks if coordinate is occupied" do
        @cell.place_ship(@cruiser)
        expect(@cell.empty?).to be false
      end

      it "checks if fired upon" do
        @cell.place_ship(@cruiser)
        expect(@cell.fired_upon?).to be false
      end

      it "checks if health -1 after being hit" do
        @cell.place_ship(@cruiser)
        @cell.fire_upon
        expect(@cruiser.health).to eq(2)
      end

      it "after being hit return being fired upon true" do
        @cell.place_ship(@cruiser)
        @cell.fire_upon
        expect(@cell.fired_upon?).to be true
      end

    before :each do
        @cell_1 = Cell.new("B4")
      end
          it "renders an empty cell" do
            expect(@cell_1.render).to eq(".")
          end

          it "gets fired upon and misses" do
            @cell_1.place_ship(@cruiser)
            @cell_1.fire_upon
            expect(@cell_1.render).to eq("M")
          end
end
