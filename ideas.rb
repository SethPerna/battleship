def occupied(ship_coordinate)
  cells_empty = true
  ship_coordinate.each do |coord|
    if @cells[coord].empty? != nil
      cells_empty = false
    elsif @cells[coord].empty? == true
      cells_empty = true
    end
  end
  cells_empty
end
def occupied(ship, ship_coordinate)
  cells_empty = true
  ship_coordinate.each do |coord|
    if valid_placement?(ship, ship_coordinate) == true && @cells[coord].empty? != nil
      cells_empty = false
    elsif valid_placement?(ship, ship_coordinate) == true && @cells[coord].empty? == true
      cells_empty = true
    end
  end
  cells_empty
end
