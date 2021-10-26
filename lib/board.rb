class Board
  attr_reader :cells,
              :cells_taken

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
    @cells_taken = []
end

  def validate_coordinate?(coordinates)
    @cells.include?(coordinates)
  end


  def valid_placement?(ship, ship_coordinate)
    return false if ship.length != ship_coordinate.count
    return false if occupied(ship_coordinate) == true # guard statement
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
    # elsif descending_numbers(number)
    #   false
    # elsif descending_letter(letter)
    #   false
    else
      false
    end
  end

  def descending_numbers(number)
    (number.first) + (number.length - 1) == number.last
  end

  def descending_letter(letter)
    (letter.first.ord) + (letter.length - 1) == letter.last.ord
  end

  def occupied(ship_coordinate)
    ship_coordinate.any? do |coord|
      @cells[coord].empty? == false
    end
  end

  def check_letters(letter)
     letter.uniq.count == 1
  end

  def check_numbers(number)
    number.uniq.count == 1
   end

 def consecutive_numbers(number)
    if (number.min.ord + 1) == (number[1].ord) && (number.max.ord - 1) == (number[1].ord)
      true
    elsif number.count == 2
      (number.min.ord + 1) == (number.max.ord)
    else
      false
    end
  end

  def consecutive_letters(letter)
     if letter.min.ord + 1 == letter[1].ord && letter.max.ord - 1 == letter[1].ord
       true
     elsif letter.count == 2
      letter.min.ord + 1 == letter.max.ord
     else
       false
     end
    end

    def place(ship, ship_coordinate)
      if valid_placement?(ship, ship_coordinate) == true
        ship_coordinate.each do |coord|
          @cells[coord].place_ship(ship)
          @cells_taken << coord
          end
        end
        @cells_taken
      end

      def ai_place_cruiser(ship, coordinates)
        loop do
          coordinates = []
          3.times do
            letter = rand(65..68).chr
            number = rand(1..4)
            coord = "#{letter}#{number}"
            coordinates << coord
          end
          if valid_placement?(ship, coordinates) == true
            place(ship, coordinates)
            break
          end
        end
      end

      def ai_place_submarine(ship, coordinates)
        loop do
          coordinates = []
          2.times do
            letter = rand(65..68).chr
            number = rand(1..4)
            coord = "#{letter}#{number}"
            coordinates << coord
          end
          if valid_placement?(ship, coordinates) == true
            place(ship, coordinates)
            break
          end
        end
      end


        def ai_fire
          fire_letter = rand(65..68).chr
          fire_number = rand(1..4)
          fire_coord = "#{fire_letter}#{fire_number}"

          until @cells[fire_coord].fired_upon? == false
            fire_letter = rand(65..68).chr
            fire_number = rand(1..4)
            fire_coord = "#{fire_letter}#{fire_number}"
          end

          if @cells[fire_coord].fired_upon? == false
            @cells[fire_coord].fire_upon
          end
          if @cells[fire_coord].render == "M"
            puts "                            My shot on #{fire_coord} was a miss"
          elsif @cells[fire_coord].render == "H"
            puts "                            My shot on #{fire_coord} was a hit"
          # elsif @cells[fire_coord].render == "X"
            # puts "My shot on #{fire_coord} was a hit and I sunk your #{@cells[fire_coord].ship.name}"
          end
        end

#spaces for test |                                   |


    # require "pry"; binding.pry
    def render(user = false)
      if user == true
        "                                      1 2 3 4 \n " +
        "                                   A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n " +
        "                                   B #{@cells['B1'].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n " +
        "                                   C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n " +
        "                                   D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n "
      else
      "                                      1 2 3 4 \n " +
      "                                   A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n " +
      "                                   B #{@cells['B1'].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n " +
      "                                   C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n " +
      "                                   D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n "
      end
    end

end
