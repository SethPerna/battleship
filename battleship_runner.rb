require './lib/board'
require './lib/cell'
require './lib/ship'


@player_board = Board.new
@comp_board = Board.new
@player_cruiser = Ship.new("Cruiser", 3)
@player_submarine = Ship.new("Submarine", 2)
@comp_cruiser = Ship.new("Cruiser", 3)
@comp_submarine = Ship.new("Submarine", 2)
@players_sunken_ships = 0
@comp_sunken_ships = 0

if @player_cruiser.sunk?
  sunken_ships += 1
end
if @player_submarine.sunk?
  sunken_ships += 1
end

if @comp_cruiser.sunk?
  sunken_ships += 1
end
if @comp_submarine.sunk?
  sunken_ships += 1
end


def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
      response = gets.strip.downcase

    until response == "p" || response == "q"
      puts "
Invalid response
Enter p to play. Enter q to quit. "

      response = gets.downcase.strip
    end

    return false if response == "q"



    puts "
I have placed my ships.
You now need to lay out your two ships.
The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render


    puts "Enter the squares for the cruiser (3 ships)"
    player_cruiser_coords = gets.chomp.split(" ")

      until @player_board.valid_placement?(@player_cruiser, player_cruiser_coords) == true do
        puts "Invalid coordinates. Please try again:"
        player_cruiser_coords = gets.chomp.split(" ")
      end
        @player_board.place(@player_cruiser, player_cruiser_coords)


    puts "Enter the squares for the submarine (2 ships)"
    player_sub_coords = gets.chomp.split(" ")

      until @player_board.valid_placement?(@player_submarine, player_sub_coords) == true do
        puts "Invalid coordinates. Please try again:"
        player_sub_coords = gets.chomp.split(" ")
      end
      @player_board.place(@player_submarine, player_sub_coords)

      @comp_board.place(@comp_cruiser, ["A1", "A2", "A3"])

    until @player_sunken_ships == 2 || @comp_sunken_ships == 2 do
      puts " ========== COMPUTER BOARD ========== "
      puts @comp_board.render(true)
      puts " ============ PLAYER BOARD ============ "
      puts @player_board.render(true)
      puts "Pick a coordinate to fire at"
      player_response = [gets.strip.capitalize]
      require "pry"; binding.pry

      if @comp_board.validate_coordinate?(player_response) == true
        @comp_board.cells[player_response].fire_upon
      else
          puts "Invalid coordinates. Please try again:"
      end





      #   if @board.cells[player_response].fired_upon? == true && @board.cells[player_response].empty? == true
      #     puts "AWW A MISS"
      #   elsif @board.cells[player_response].fired_upon? == true && @board.cells[player_response].empty? == false && @cruiser.sunk? == false || @submarine.sunk? == false
      #     puts "Thats a HIT"
      #   elsif  @board.cells[player_response].fired_upon? == true && @cruiser.sunk? == true || @submarine.sunk? == true
      #
      #     if @cruiser.sunk? == true
      #       put "Cruiser was sunk!"
      #     elsif @submarine.sunk? == true
      #       put "Submarine was sunk!"
      #     end
      #   end
      # end

    end
end

start
