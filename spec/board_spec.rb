require './lib/board'
require './lib/cell'
require './lib/ship'
RSpec.describe do
  it "returns value as instance of class" do
    board = Board.new
    expect(board.cells["A1"]).to be_a(Cell)
    expect(board.cells["A2"]).to be_a(Cell)
    expect(board.cells["A3"]).to be_a(Cell)
    expect(board.cells["A4"]).to be_a(Cell)
    expect(board.cells["B1"]).to be_a(Cell)
    expect(board.cells["B2"]).to be_a(Cell)
    expect(board.cells["B3"]).to be_a(Cell)
    expect(board.cells["B4"]).to be_a(Cell)
    expect(board.cells["C1"]).to be_a(Cell)
    expect(board.cells["C2"]).to be_a(Cell)
    expect(board.cells["C3"]).to be_a(Cell)
    expect(board.cells["C4"]).to be_a(Cell)
    expect(board.cells["D1"]).to be_a(Cell)
    expect(board.cells["D2"]).to be_a(Cell)
    expect(board.cells["D3"]).to be_a(Cell)
    expect(board.cells["D4"]).to be_a(Cell)
  end

  it "can validate coordinates" do
    board = Board.new

    expect(board.validate_coordinate?("A1")).to be true
    expect(board.validate_coordinate?("D4")).to be true
    expect(board.validate_coordinate?("A5")).to be false
    expect(board.validate_coordinate?("E1")).to be false
    expect(board.validate_coordinate?("A22")).to be false

  end

  before :each do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
  it "exists" do
    expect(@board).to be_an_instance_of(Board)
    expect(@cruiser).to be_an_instance_of(Ship)
    expect(@submarine).to be_an_instance_of(Ship)
  end



  # xit "takes the coordinates given and splits the array" do
  #   expect(@board.coord_split(["A1", "A2", "A4"])).to eq([["A", "1"], ["A", "2"], ["A", "4"]])
  # end
  #
  # xit "collects the numbers from the split arrays" do
  #   expect(@board.pull_numbers([["A", "1"], ["A", "2"], ["A", "4"]])).to eq(["1", "2", "4"])
  # end
  #
  # xit "collects the letters from the split arrays" do
  #   expect(@board.pull_letters([["A", "1"], ["A", "2"], ["A", "4"]])).to eq(["A", "A", "A"])
  # end


  it "checks that the letters pulled are the not the same" do
    expect(@board.check_letters(["A", "A", "B"])).to eq false
  end

  it "checks that the letters pulled are the same" do
    expect(@board.check_letters(["A", "A", "A"])).to eq true
  end

  it "checks if the numbers are the same " do
    expect(@board.check_numbers(["1", "1", "1"])).to eq true
  end

  it "checks if the numbers are the same " do
    expect(@board.check_numbers(["1", "1", "2"])).to eq false
  end

  it "checks if the numbers are consecutive" do
    expect(@board.consecutive_numbers(["1", "2", "3"])).to eq true
  end

  it "checks if the numbers are not consecutive_numbers" do
    expect(@board.consecutive_numbers(["1", "3", "3"])).to eq false
  end

  it "checks if the letters are consecutive " do
  expect(@board.consecutive_letters(["A", "B", "C"])).to eq true
  end

  it "checks if the letters are not consecutive " do
  expect(@board.consecutive_letters(["A", "B", "A"])).to eq false
  end

  it "validates placement" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be false
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be false
  end

  it "validates more possible placements" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be false
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be false
  end

  it "validates more possible placements" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to be true
  end

end
