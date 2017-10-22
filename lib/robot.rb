class Robot

  attr_accessor :orientation

  def left
    new_orientation = {
      "NORTH" => "WEST",
      "WEST" => "SOUTH",
      "SOUTH" => "EAST",
      "EAST" => "NORTH",
    }
    self.orientation = new_orientation[self.orientation]

  end

  def right
    new_orientation = {
      "NORTH" => "EAST",
      "EAST" => "SOUTH",
      "SOUTH" => "WEST",
      "WEST" => "NORTH",
    }
    self.orientation = new_orientation[self.orientation]
  end

  def direction(orientation)
    if ["NORTH", "SOUTH", "EAST", "WEST"].include?(orientation)
      self.orientation = orientation
    else
      false
    end
  end

  def vector
    case self.orientation
    when "NORTH"
      { x: 0, y: 1 }
    when "SOUTH"
      { x: 0, y: -1 }
    when "WEST"
      { x: -1, y: 0 }
    when "EAST"
      { x: 1, y: 0 }
    else
      raise "Unknown orientation #{self.orientation}"
    end
  end



end
