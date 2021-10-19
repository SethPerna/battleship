class Ship
  attr_reader :name, :length, :health
  def initialize(name, length)
    @name = name
    @length = length
  end

  def health
    length
  end

  def sunk?
    if health == 0
      true
    else
      false
    end
  end
end
