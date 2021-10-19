class Cell
  attr_accessor :coordinate,
                :ship



  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if  @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ships)
    @ship = ships
    ships = Ship.new(@name, @health)
  end

  def fired_upon?
    false
  end

  def fire_upon
    fired_upon? == true
    @ship.hit
  end
end
