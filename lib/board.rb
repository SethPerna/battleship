class Board
  attr_reader :cells
  def initialize
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
  end

  def validate_coordinate?(coordinates)
    @cells.include?(coordinates)
  end
#
#   def valid_placement?(ship, ship_coordinate)
#       if ship.length == ship_coordinate.count
#         true
#
#       else
#         false
#       end
#   end
  def block_1
    [A1, A2, A3, A4]
  end

  def block_2
    [B1, B2, B3, B4]
  end

  def block_3
    [C1, C2, C3, C4]
  end

  def block_4
    [D1, D2, D3, D4]
  end

  def block_5
    [A1, B1, C1, D1]
  end

  def block_6
    [A2, B2, C2, D2]
  end

  def block_7
    [A3, B3, C3, D3]
  end

  def block_8
    [A4, B4, C4, D4]
  end




  def valid_placement?(ship, ship_coordinate)

      if ship.length == ship_coordinate.count
        true
          if ship_coordinate[0] == block_1
            block_1.eachcon(ship.length) do |block_1|
              ship_coordinate << block_1
            end
          elsif ship_coordinate[0] == block_2
            block_2.eachcon(ship.length) do |block_2|
              ship_coordinate << block_2
            end
          elsif ship_coordinate[0] == block_3
            block_3.eachcon(ship.length) do |block_3|
              ship_coordinate << block_3
            end
          elsif ship_coordinate[0] == block_4
            block_4.eachcon(ship.length) do |block_4|
              ship_coordinate << block_4
            end
          elsif ship_coordinate[0] == block_5
            block_5.eachcon(ship.length) do |block_5|
              ship_coordinate << block_5
            end
          elsif ship_coordinate[0] == block_6
            block_6.eachcon(ship.length) do |block_6|
              ship_coordinate << block_6
            end
          elsif ship_coordinate[0] == block_7
            block_7.eachcon(ship.length) do |block_7|
              ship_coordinate << block_7
            end
          elsif ship_coordinate[0] == block_8
            block_8.eachcon(ship.length) do |block_8|
              ship_coordinate << block_8
            end
          end
      else
        false
      end

  end
end
