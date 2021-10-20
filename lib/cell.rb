class Cell
  attr_accessor :coordinate,
                :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end
  def empty?
    if  @ship == nil #@ship.nil
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
    if empty? == false
      @ship.hit
    end
    @fired_upon = true
  end
  def render(user = false)
    if !fired_upon? && !empty? && user == true
      "S"
    elsif fired_upon? == false
      "."
    elsif fired_upon? == true && empty? == false && @ship.sunk? == false
      "H"
    elsif fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && @ship.sunk? == true
      "X"
    end
  end
end
