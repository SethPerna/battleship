require './lib/board'
require './lib/cell'
require './lib/ship'

class Computer
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def ai_place_cruiser
    cruiser = Ship.new("cruiser", 3)
    loop do
      coordinates = []
      cruiser.length.times do
        letter = rand(65..68).chr
        number = rand(1..4)
        coord = "#{letter}#{number}"
        coordinates << coord
      end
      if @board.valid_placement?(cruiser, coordinates) == true
        @board.place(cruiser, coordinates)
        break
      end
    end
  end

  def ai_place_submarine
    submarine = Ship.new("submarine", 2)
    loop do
      coordinates = []
      submarine.length.times do
        letter = rand(65..68).chr
        number = rand(1..4)
        coord = "#{letter}#{number}"
        coordinates << coord
      end
      if @board.valid_placement?(submarine, coordinates) == true
        @board.place(submarine, coordinates)
        break
      end
    end
  end

end
