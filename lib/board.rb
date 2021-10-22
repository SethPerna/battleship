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
      if ship.length == ship_coordinate.count
        true
        # if consecutive_letters == true && check_numbers == true
        #   true
        # elsif consecutive_numbers == true && check_letters == true
        #   true
        # else
        #   false
        # end
      else
        false
      end

  end

  def coord_split(ship_coordinate)
    letter_num = []
    ship_coordinate.each do |split_coord| #[["A", "1"], ["A", "2"], ["A", "4"]]
      letter_num << split_coord.split('')
    end
    pull_numbers(letter_num)
    pull_letters(letter_num)
    letter_num
  end

  def pull_numbers(ship_coordinate)
      number = []
      ship_coordinate.each do |num|
      number << num.slice(1)
      end
      check_numbers(number)
      consecutive_numbers(number)
    number
  end

  def pull_letters(ship_coordinate)
      letter = []
      ship_coordinate.each do |letters|
        letter << letters.slice(0)
      end
      check_letters(letter)
      consecutive_letters(letter)
      letter
  end

  def check_letters(ship_coordinate)
       if ship_coordinate.min == ship_coordinate.max && ship_coordinate[1] == ship_coordinate.max
          true
        else
          false
      end
  end

  def check_numbers(ship_coordinate)
    if ship_coordinate.min == ship_coordinate.max && ship_coordinate[1] == ship_coordinate.max
       true
     else
       false
     end
   end

   def consecutive_numbers(ship_coordinate)
     if ship_coordinate.min != ship_coordinate.max
       true
       # if ship.length == 3
          if ship_coordinate.min.ord + 1 == ship_coordinate[1].ord && (ship_coordinate.max.ord - 1) == ship_coordinate[1].ord
            true
          else
            false
          end
        # elsif  ship.length == 2
        #   if ship_coordinate.min + 1 == ship_coordinate.max
        #     true
        #   end
      # end
    elsif ship_coordinate.min == ship_coordinate.max
      false
    end
  end

  def consecutive_letters(ship_coordinate)
    if ship_coordinate.min != ship_coordinate.max
      true
      # if ship.length == 3
         if ship_coordinate.min.ord + 1 == ship_coordinate[1].ord && (ship_coordinate.max.ord - 1) == ship_coordinate[1].ord
           true
         else
           false
         end
       # elsif  ship.length == 2
       #   if ship_coordinate.min + 1 == ship_coordinate.max
       #     true
       #   end
     # end
   elsif ship_coordinate.min == ship_coordinate.max
     false
   end
 end
end
