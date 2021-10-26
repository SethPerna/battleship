require './lib/board'
require './lib/cell'
require './lib/ship'

class Game

  def initialize
    @player_board = Board.new
    @comp_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
    @players_sunken_ships = 0
    @comp_sunken_ships = 0
    greeting
    end_game
  end

  def greeting
    puts "                             Welcome to BATTLESHIP"
    puts "                        Enter p to play. Enter q to quit."
    response = gets.strip.downcase

    until response == "p" || response == "q"
      puts "                              Invalid response"
      puts "                       Enter p to play. Enter q to quit. "

      response = gets.downcase.strip
    end

    if response == "p"
      start
    end
    return false if response == "q"
  end

  def start

    @comp_board.ai_place_cruiser(@comp_cruiser, [])
    @comp_board.ai_place_submarine(@comp_submarine, [])

    puts "
                                I have placed my ships.
                          You now need to lay out your two ships.
              The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render

    puts "                     Enter the squares for the cruiser (3 ships)"
    player_cruiser_coords = gets.chomp.split(" ")

    until @player_board.valid_placement?(@player_cruiser, player_cruiser_coords) == true do
      puts "                       Invalid coordinates. Please try again:"
      player_cruiser_coords = gets.chomp.split(" ")
    end
    @player_board.place(@player_cruiser, player_cruiser_coords)


    puts "                    Enter the squares for the submarine (2 ships)"
    player_sub_coords = gets.chomp.split(" ")

    until @player_board.valid_placement?(@player_submarine, player_sub_coords) == true do
      puts "                       Invalid coordinates. Please try again:"
      player_sub_coords = gets.chomp.split(" ")
    end
    @player_board.place(@player_submarine, player_sub_coords)



    until @players_sunken_ships == 2 || @comp_sunken_ships == 2 do

      @players_sunken_ships = 0
      @comp_sunken_ships = 0

      if @player_cruiser.sunk?
        @players_sunken_ships += 1
      end
      if @player_submarine.sunk?
        @players_sunken_ships += 1
      end

      if @comp_cruiser.sunk?
        @comp_sunken_ships += 1
      end
      if @comp_submarine.sunk?
        @comp_sunken_ships += 1
      end

      puts "                      =========== COMPUTER BOARD =========== "
      puts                                 @comp_board.render #(true) # for testing purposes
      puts "                      ============ PLAYER BOARD ============ "
      puts                                 @player_board.render(true)
      puts "                           Pick a coordinate to fire at"
      # require "pry"; binding.pry
      player_response = gets.chomp.capitalize

      until @comp_board.validate_coordinate?(player_response) == true do   #&& @comp_board.cells[player_response].fired_up? == true do
        puts "                       Invalid coordinates. Please try again:"
        player_response = gets.chomp.capitalize
      end
      @comp_board.cells[player_response].fire_upon

      @player_board.ai_fire

      if @comp_board.cells[player_response].fired_upon? == true && @comp_board.cells[player_response].empty? == true
        puts "                            Your shot on #{player_response} was a miss"
      elsif @comp_board.cells[player_response].fired_upon? == true && @comp_board.cells[player_response].empty? == false && @comp_cruiser.sunk? == false
        puts "                            Your shot on #{player_response} was a HIT"
      elsif @comp_board.cells[player_response].fired_upon? == true && @comp_board.cells[player_response].empty? == false && @comp_submarine.sunk? == false
        puts "                            Your shot on #{player_response} was a HIT"
      end

      if @player_cruiser.health == 0
        puts "                            Your Cruiser was sunk"
      end
      if @player_submarine.health == 0
        puts "                            Your Submarine was sunk"
      end

      if @comp_cruiser.health == 0
        puts "                           Computer Cruiser was sunk"
      end
      if @comp_submarine.health == 0
        puts "                          Computer Submarine was sunk"
      end
    end
  end

  def end_game
    if @players_sunken_ships == 2
      puts "                          ========= GAME OVER ========= "
      puts "                                      I won!"

    elsif @comp_sunken_ships == 2
      puts "                          ========= GAME OVER ========= "
      puts "                                     You won!"
    end
  end
end


# puts '                           Would you like to play again?'
# puts '                              Type Yes to play again    '
# puts '                                       or           '
# puts '                              anything else to quit    '
#
# play_again = gets.chomp.strip.capitalize
# if play_again == "Yes"
#   start
# else
# greeting
# end