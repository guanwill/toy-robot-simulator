require 'pry'
require_relative './robot'
require_relative './table'
require_relative './messages'

class Command

  def initialize
    @table = Table.new
    @robot = Robot.new
    @messages = Messages.new
  end

  # Starts the game and prompts for user input
  def initiate
    # Show instructions
    @messages.introduction_instructions

    # Ask for user's input. Capitalize everything for easier validations
    loop do
      puts "\nPlease enter a command below..."
      execute(gets.chomp.upcase)
    end
  end

  # Grabs user input and respond with an action
  def execute(input)
    return if input.strip.empty?

    #Get rid of leading and trailing white spaces. Split the input that has one or more space characters in between. This creates an array
    input_split = input.strip.split(/\s+/)
    #Grabs the first index in the array which should be one of the main commands
    command = input_split.first
    #Grabs coordinates and direction when placing robot. This variable is Not used for any other purposes
    arguments = input_split.last

    # Each input triggers a method
    case command
    when 'PLACE'
      place(arguments)
    when 'REPORT'
      report
    when 'MOVE'
      move
    when 'LEFT'
      left
    when 'RIGHT'
      right
    when 'HELP'
      help
    when 'EXIT'
      exit
    else
      @messages.invalid_command
    end
  end

  # Places the robot given coordinates and direction
  def place(arguments)
     arguments_split = arguments.split(",")
     # Get X and Y coordinates
     x = arguments_split[0].to_i
     y = arguments_split[1].to_i
     # Get user's desired orientation
     orientation = arguments_split[2]

     # Before placing the robot, check if it is within table boundaries
     if @table.valid_coordinates?(x,y) && @robot.direction(orientation)
       @table.place(x,y)
       @messages.robot_placement_confirm
     else
       @messages.robot_invalid_placement
     end
  end

  # Update robot orientation if robot has already been placed
  def left
    if @table.robot_present?
      @robot.left
      @messages.robot_action_confirm
    else
      return @messages.robot_not_placed
    end
  end

  # Update robot orientation if robot has already been placed
  def right
    if @table.robot_present?
      @robot.right
      @messages.robot_action_confirm
    else
      return @messages.robot_not_placed
    end
  end

  # Update x or y coordinates by 1 depending on current direction if robot has already been placed
  def move
    if @table.robot_present?
      vector = @robot.vector
      position = @table.robot_position
    else
      return @messages.robot_not_placed
    end

    # gets current coordinates from table clasas and update it
    if @table.place(position[:x] + vector[:x], position[:y] + vector[:y])
      @messages.robot_action_confirm
    else
      @messages.off_table
    end
  end

  # Gets robot position from table class and direction from robot class and display it
  def report
    if @table.robot_present?
      position = @table.robot_position
      orientation = @robot.orientation
      @messages.report(position, orientation)
      return "#{position[:x]},#{position[:y]},#{orientation.to_s.upcase}"
    else
      @messages.robot_not_placed
    end
  end

  # Displays simulation instructions
  def help
    @messages.introduction_instructions
  end


end
