class Cell
  attr_accessor :coordinate,
                :ship


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(cruiser)
    @ship = cruiser
    cruiser = Ship.new(@ship, @health)

  end
end
