require './lib/ship'


RSpec.describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end
  it "exists" do
    expect(@cruiser).to be_an_instance_of(Ship)
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.name).to eq("Cruiser")
  end
  it "returns health" do
    expect(@cruiser.health).to eq(3)
  end
  it "checks if ship is #sunk" do
    expect(@cruiser.sunk?).to be false
  end
  it "lowers health when #hit" do
    expect(@cruiser.hit).to eq(2)
  end
  it "lowers health again" do
    @cruiser.hit
    expect(@cruiser.hit).to eq(1)
  end
  it "check if ship #sunk is again" do
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to be false
  end
  it "returns ship is #sunk" do
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to be true
  end
end
