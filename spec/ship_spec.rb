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
end
