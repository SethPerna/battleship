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

  def valid_placement?(ship, ship_coordinate)

    return false if ship.length != ship_coordinate.count # guard statement
          letter = []
          number = []
          ship_coordinate.each do |coord|
            letter << coord[0]
            number << coord[1]
          end

          if consecutive_letters(letter) == true && check_numbers(number) == true
            true
          elsif consecutive_numbers(number) == true && check_letters(letter) == true
            true
          else
            false
          end

  end

  def check_letters(letter)
     letter.uniq.count == 1
  end

  def check_numbers(number)
    number.uniq.count == 1
   end

   def consecutive_numbers(number)
          if number.min.ord + 1 == number[1].ord && number.max.ord - 1 == number[1].ord
            true
          elsif number.count == 2
            (number.min.ord + 1) == number.max.ord
          else
            false
          end

    end

    def consecutive_letters(letter)
           if letter.min.ord + 1 == letter[1].ord && letter.max.ord - 1 == letter[1].ord
             true
          elsif letter.count == 2
            (letter.min.ord + 1) == letter.max.ord
           else
             false
           end

    end

    def place(ship, ship_coordinate)
      ship_coordinate.each do |coord|
        @cells[coord].place_ship(ship)
        # if valid_placement?(ship, ship_coordinate) == true && @cells[coord].empty? == true
        #   true
        # else
        #   false
        # end
      end
  end
end
