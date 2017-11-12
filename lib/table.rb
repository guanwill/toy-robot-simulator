class Table
  attr_accessor :robot_position

  # Assign x,y coordinates if its within table bounds
  def place(x, y)
    self.robot_position = {
      x: x,
      y: y
      } if valid_coordinates?(x, y)
  end

  # Is robot on the table? i.e has x,y coordinates
  def robot_present?
    self.robot_position != nil
  end

  # Set Table Boundaries
  def valid_coordinates?(x, y)
    (x >= 0 && x <= 5 && y >= 0 && y <= 5)
  end

end
