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
          letter = []
          number = []
          ship_coordinate.each do |coord|
            letter << coord[0].ord
            number << coord[1]
          end

      if ship.length == ship_coordinate.count
        true
        if ship.length == 3
          if consecutive_letters(letter) == true && check_numbers(number) == true
            true
          elsif consecutive_numbers(number) == true && check_letters(letter) == true
            true
          else
            false
          end
        elsif ship.length == 2
          if consecutive_letters_sub(letter) == true && check_numbers(number) == true
            true
          elsif consecutive_numbers_sub(number) == true && check_letters(letter) == true
            true
          else
            false
          end
        end
      else
        false
      end
  end

  # def coord_split(ship_coordinate)
  #   letter_num = []
  #   ship_coordinate.each do |split_coord| #[["A", "1"], ["A", "2"], ["A", "4"]]
  #     letter_num << split_coord.split('')
  #   end
  #   pull_numbers(letter_num)
  #   pull_letters(letter_num)
  #   letter_num
  # end
  #
  # def pull_numbers(letter_num)
  #     number = []
  #     letter_num.each do |num|
  #       number << num.slice(1)
  #     end
  #     check_numbers(number)
  #     consecutive_numbers(number)
  #   number
  # end
  #
  # def pull_letters(letter_num)
  #     letter = []
  #     letter_num.each do |letters|
  #       letter << letters.slice(0)
  #     end
  #     check_letters(letter)
  #     consecutive_letters(letter)
  #   letter
  # end

  def check_letters(letter)
       if letter.min == letter.max && letter[1] == letter.max
          true
        else
          false
      end
  end

  def check_numbers(number)
    if number.min == number.max && number[1] == number.max
       true
     else
       false
     end
   end

   def consecutive_numbers(number)
     if number.min != number.max
       true
          if number.min.ord + 1 == number[1].ord && number.max.ord - 1 == number[1].ord
            true
          else
            false
          end
    elsif number.min == number.max
      false
    end
  end

    def consecutive_letters(letter)
      if letter.min != letter.max
        true
           if letter.min.ord + 1 == letter[1].ord && (letter.max.ord - 1) == letter[1].ord
             true
           else
             false
           end
     elsif letter.min == letter.max
       false
     end
   end

   def consecutive_letters_sub(letter)
     if letter.min != letter.max
       true
       if letter.min.ord + 1 == letter[1].ord
       end
    else
      false
    end
  end
  def consecutive_numbers_sub(number)
    if number.min != number.max
      true
      if number.min.ord + 1 == number[1].ord
        true
      end
    else false
  end
 end

end
