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

@comp_board.ai_place_cruiser(@comp_cruiser, [])
@comp_board.ai_place_submarine(@comp_submarine, [])

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



    until @player_sunken_ships == 2 || @comp_sunken_ships == 2 do


      if @player_cruiser.sunk?
        @player_sunken_ships += 1
      end
      if @player_submarine.sunk?
        @player_sunken_ships += 1
      end

      if @comp_cruiser.sunk?
        @comp_sunken_ships += 1
      end
      if @comp_submarine.sunk?
        @comp_sunken_ships += 1
      end


      puts " =========== COMPUTER BOARD =========== "
      puts @comp_board.render(true)
      puts " ============ PLAYER BOARD ============ "
      puts @player_board.render(true)
      puts "Pick a coordinate to fire at"
      # require "pry"; binding.pry
      player_response = gets.chomp

      if @comp_board.validate_coordinate?(player_response) == true
      @comp_board.cells[player_response].fire_upon
      else
          puts "Invalid coordinates. Please try again:"
          player_cruiser_coords = gets.chomp.split(" ")

          if @comp_board.validate_coordinate?(player_response) == true
          @comp_board.cells[player_response].fire_upon
          else
              puts "Invalid coordinates. Please try again:"
              player_cruiser_coords = gets.chomp.split(" ")
              @comp_board.cells[player_response].fire_upon
            end
      end



      # @comp_board.cells[player_response].fire_upon
      #   until @comp_board.validate_coordinate?(coordinate) == true && not empty  do
      #     puts "Invalid coordinates. Please try again:"
      #     player_cruiser_coords = gets.chomp.split(" ")
      #   end
      #     @comp_board.cells[player_response].fire_upon


      if @comp_board.cells[player_response].fired_upon? == true && @comp_board.cells[player_response].empty? == true
        puts "Your shot on #{player_response} was a miss"
      elsif @comp_board.cells[player_response].fired_upon? == true && @comp_board.cells[player_response].empty? == false && (@comp_cruiser.sunk? == false || @comp_submarine.sunk? == false)
        puts "Your shot on #{player_response} was a HIT"
      elsif  @comp_board.cells[player_response].fired_upon? == true && @comp_cruiser.sunk? == true || @comp_submarine.sunk? == true

        if @comp_cruiser.sunk? == true
          puts "Cruiser was sunk!"
        elsif @comp_submarine.sunk? == true
          puts "Submarine was sunk!"
        end
      end
      # if @comp_board.cells[player_response] && @comp_board.cells[player_response].empty? == true
    end

    puts " ========= GAME OVER ========= "
    if @player_sunken_ships == 0
      puts "I win"
      puts 'Would you like to play again?'
      puts 'Type Yes to play again'
      puts 'anything else to quit'
      play_again = gets.chomp
      if play_again == yes
        start
      else
      end
    elsif @comp_sunken_ships == 0
      puts "You won!"
      puts 'Would you like to play again?'
      puts 'Yes to play again'
      puts 'anything else to quit'
      play_again = gets.chomp
      if play_again == yes
        start
      else
      end
    else
  end
end


start





      #

        # if @comp_board.cells[player_response].fired_upon? == true && @comp_board.cells[player_response].empty? == true
        #   puts "AWW A MISS"
        # elsif @comp_board.cells[player_response].fired_upon? == true && @comp_board.cells[player_response].empty? == false && @comp_cruiser.sunk? == false || @comp_submarine.sunk? == false
        #   puts "Thats a HIT"
        # elsif  @comp_board.cells[player_response].fired_upon? == true && @comp_cruiser.sunk? == true || @comp_submarine.sunk? == true
        #
        #   if @comp_cruiser.sunk? == true
        #     put "Cruiser was sunk!"
        #   elsif @comp_submarine.sunk? == true
        #     put "Submarine was sunk!"
        #   end
        # end
