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
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq false
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq false
  end

  it "validates more possible placements" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq false
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq false
  end

  it "validates more possible placements" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq true
    expect(@board.valid_placement?(@cruiser, ["B1", "B2", "B3"])).to eq true
    expect(@board.valid_placement?(@cruiser, ["A1", "B1", "C1"])).to eq true
    expect(@board.valid_placement?(@cruiser, ["B2", "C3", "D4"])).to eq false
  end

  it "checks more possible placements" do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq true
    expect(@board.valid_placement?(@submarine, ["A2", "A4"])).to eq false
    expect(@board.valid_placement?(@submarine, ["B1", "C1"])).to eq true
    expect(@board.valid_placement?(@submarine, ["C2", "D2"])).to eq true
  end
    before :each do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]

  end

    it "checks that method place is placing ship in a cell" do
      expect(@cell_1.empty?).to eq false
      expect(@cell_2.empty?).to eq false
      expect(@cell_3.empty?).to eq false
    end

    it "checks if a ship occupies multiple cells" do
      expect(@cell_1.ship == @cell_2.ship).to eq true
    end

    it "checks if we can put a ship where one was already placed" do
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq false
      expect(@board.valid_placement?(@submarine, ["A2", "B2"])).to eq false
      expect(@board.valid_placement?(@submarine, ["A3", "B3"])).to eq false

    end
    it "checks if valid placements after shgip placed " do
      expect(@board.valid_placement?(@submarine, ["B1", "B2"])).to eq true
      expect(@board.valid_placement?(@submarine, ["A4", "B4"])).to eq true
      expect(@board.valid_placement?(@submarine, ["C1", "C2"])).to eq true

    end
    it "renders the board " do

      @cells = {
          "A1" => Cell.new("A1"),
          "A2" => Cell.new("A2"),
          "A3" => Cell.new("A3"),
          'A4' => Cell.new("A4"),
          "B1" => Cell.new("B1"),
          "B2" => Cell.new("B2"),
          "B3" => Cell.new("B3"),
          'B4' => Cell.new("B4"),
          "C1" => Cell.new("C1"),
          "C2" => Cell.new("C2"),
          "C3" => Cell.new("C3"),
          'C4' => Cell.new("C4"),
          "D1" => Cell.new("D1"),
          "D2" => Cell.new("D2"),
          "D3" => Cell.new("D3"),
          'D4' => Cell.new("D4")
        }

      expect(@board.render).to eq("   1 2 3 4 \n " +
      "A . . . . \n " +
      "B . . . . \n " +
      "C . . . . \n " +
      "D . . . . \n ")
      end

    it "renders the board for the player (true)" do
    expect(@board.render(true)).to eq("   1 2 3 4 \n " +
      "A S S S . \n " +
      "B . . . . \n " +
      "C . . . . \n " +
      "D . . . . \n ")
    end

    it "renders ship and hits and misses(true)" do
      @cell_1.fire_upon
      @cell_3.fire_upon
      @cell_4 = @board.cells["A4"]
      @cell_4.fire_upon

    expect(@board.render(true)).to eq("   1 2 3 4 \n " +
      "A H S H M \n " +
      "B . . . . \n " +
      "C . . . . \n " +
      "D . . . . \n ")
    end

    it "renders hits and misses" do
      @cell_1.fire_upon
      @cell_3.fire_upon
      @cell_4 = @board.cells["A4"]
      @cell_4.fire_upon

    expect(@board.render).to eq("   1 2 3 4 \n " +
    "A H . H M \n " +
    "B . . . . \n " +
    "C . . . . \n " +
    "D . . . . \n ")
    end

    it "renders sunken ships" do
      @cell_1.fire_upon
      @cell_3.fire_upon
      @cell_4 = @board.cells["A4"]
      @cell_4.fire_upon
      @cell_2.fire_upon

    expect(@board.render).to eq("   1 2 3 4 \n " +
    "A X X X M \n " +
    "B . . . . \n " +
    "C . . . . \n " +
    "D . . . . \n ")
    end

end
