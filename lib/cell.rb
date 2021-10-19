class Cell
  attr_accessor :coordinate,
                :ship




  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if  @ship != @coordinate
      true
    else
      false
    end
  end

  def place_ship(ships)
    @ship = ships
    ships = Ship.new("Cruiser", 3) 
  end
end
