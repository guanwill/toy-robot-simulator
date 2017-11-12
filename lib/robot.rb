class Robot
  attr_accessor :orientation

  # Grabs current orientation, passes it as key to the hash to grab new orientation
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

  # When placing the robot, it grabs user input and validates whether direction is NSEW. It must be N,S,E,W
  def direction(orientation)
    if ["NORTH", "SOUTH", "EAST", "WEST"].include?(orientation)
      self.orientation = orientation
    else
      false
    end
  end

  # Each direction corresponds to 1 or -1 for x or y. Will be used to add or minus 1 from current coordinates x,y
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
    end
  end

end
