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

  def initiate
    @messages.introduction_instructions
    loop do
      puts "\nPlease enter a command below..."
      execute(gets.chomp.upcase)
    end
  end

  def execute(input)
    return if input.strip.empty?

    input_split = input.split(/\s+/) #splits the input according to one or more space characters
    command = input_split.first
    arguments = input_split.last

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

  def place(arguments)
     arguments_split = arguments.split(",")
     x = arguments_split[0].to_i
     y = arguments_split[1].to_i
     orientation = arguments_split[2]

     if @table.valid_coordinates?(x,y) && @robot.direction(orientation)
       @table.place(x,y)
       @messages.robot_placement_confirm
     else
       @messages.robot_invalid_placement
     end
  end

  def left
    if @table.robot_present?
      @robot.left
      @messages.robot_action_confirm
    else
      return @messages.robot_not_placed
    end
  end

  def right
    if @table.robot_present?
      @robot.right
      @messages.robot_action_confirm
    else
      return @messages.robot_not_placed
    end
  end

  def move
    if @table.robot_present?
      vector = @robot.vector
      position = @table.robot_position
    else
      return @messages.robot_not_placed
    end

    # move robot by 1
    if @table.place(position[:x] + vector[:x], position[:y] + vector[:y])
      @messages.robot_action_confirm
    else
      @messages.off_table
    end
  end

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

  def help
    @messages.introduction_instructions
  end


end
