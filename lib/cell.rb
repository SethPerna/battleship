class Cell
  attr_accessor :coordinate,
                :ship,
                :ship_coordinates

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    # @ship_coordinates = []
  end

  def empty?
    if  @ship_coordinates != @coordinate
      true
    else
      false
    end
  end

  def place_ship(ships, ship_coordinates)
    @ship = ships
    ships = Ship.new(@name, @health)

  end
end
