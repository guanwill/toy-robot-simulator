class Table
  attr_accessor :robot_position

  def place(x, y)
    self.robot_position = {
      x: x,
      y: y
      } if valid_coordinates?(x, y)
  end

  def robot_present?
    self.robot_position != nil
  end

  private

  def valid_coordinates?(x, y)
    (x >= 0 && x <= 5 && y >= 0 && y <= 5)
  end

end
