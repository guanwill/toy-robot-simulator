module Messages

  def introduction_instructions
    puts "---------------------------"
    puts "INSTRUCTIONS"
    puts "---------------------------"
    puts "Your key commands are PLACE, MOVE, LEFT, RIGHT, REPORT, HELP, and EXIT.\n\n"
    puts "--- PLACE X,Y,D ---\n"
    puts "It will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. Example: PLACE 2,2,NORTH\n\n"
    puts "--- MOVE ---\n"
    puts "It will move the toy robot one unit forward in the direction it is currently facing.\n\n"
    puts "--- LEFT ---\n"
    puts "It will rotate the robot 90 degrees in the specified direction without changing the position of the robot.\n\n"
    puts "--- RIGHT ---\n"
    puts "It will rotate the robot 90 degrees in the specified direction without changing the position of the robot.\n\n"
    puts "--- REPORT ---\n"
    puts "It will announce the X,Y and F of the robot.\n\n"
    puts "--- HELP ---\n"
    puts "It will display the instructions.\n\n"
    puts "--- EXIT ---\n"
    puts "It will exit the application\n"
  end

  # Currently not used
  def prompt_for_command
    puts "---------------------------"
    puts "ENTER ONE OF THE FOLLOWING"
    puts "---------------------------"
    puts "PLACE X,Y,DIRECTION"
    puts "LEFT OR RIGHT"
    puts "MOVE"
    puts "REPORT"
    puts "INSTRUCTIONS"
    puts "EXIT"
  end

  def invalid_command
    puts "\n````ERROR````\nInvalid Command. Please try again or type HELP for instructions."
  end

  def robot_not_placed
    puts "\n````ERROR````\nYou have not placed the Robot on the table yet. Try enter PLACE,X,Y,DIRECTION"
  end

  def robot_action_confirm
    puts "\n````CONFIRM````\nRobot has moved. You can enter REPORT to see current robot position"
  end

  def robot_placement_confirm
    puts "\n````CONFIRM````\nRobot has been placed. You can enter REPORT to see current robot position"
  end

  def robot_invalid_placement
    puts "\n````ERROR````\nInvalid placement. Please try again or type HELP for instructions."
  end

  def report(position, orientation)
    puts "\n````ROBOT STATUS````\nPosition: #{position[:x]},#{position[:y]},#{orientation.to_s.upcase}"
  end

  def off_table
    puts "\n````ERROR````\nYour robot will fall of the table. And die. And ressurect. Turn super saiyan. And blow up the earth."
  end

end
