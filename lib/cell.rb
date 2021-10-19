class Cell
  attr_accessor :coordinate,
                :ship


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ()
  end

  def empty?
    if @ship != @coordinate
      true
    else
      false
    end
  end
end
