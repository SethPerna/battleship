class Cell
  attr_accessor :coordinate,
                :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
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
  end
  def fired_upon?
     @fired_upon
  end
  def fire_upon
    @ship.hit
    @fired_upon = true
  end
  def render
    if fired_upon? == false
      "."
    elsif fired_upon? == true && empty? == false
      "M"
    elsif fired_upon? && empty? == true
      "H"
    elsif fired_upon? && @ship.sunk?
      "X"
    end
  end
end
