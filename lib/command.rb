require 'pry'
require_relative './robot'
require_relative './table'
require_relative './messages'

class Command

  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def initiate
    Messages.introduction_instructions
    loop do
      puts "\nPlease enter a command below..."
      run_command(gets.chomp.upcase)
    end
  end

  def run_command(input)
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
      Messages.invalid_command
    end

  end

  def place(arguments)
     arguments_split = arguments.split(",")
     x = arguments_split[0].to_i
     y = arguments_split[1].to_i
     orientation = arguments_split[2]

     if @table.valid_coordinates?(x,y) && @robot.direction(orientation)
       @table.place(x,y)
       Messages.robot_placement_confirm
     else
       Messages.robot_invalid_placement
     end
  end

  def left
    if @table.robot_present?
      @robot.left
      Messages.robot_action_confirm
    else
      Messages.robot_not_placed
      return
    end
  end

  def right
    if @table.robot_present?
      @robot.right
      Messages.robot_action_confirm
    else
      Messages.robot_not_placed
      return
    end
  end

  def move
    if @table.robot_present?
      vector = @robot.vector
      position = @table.robot_position
    else
      Messages.robot_not_placed
      return
    end

    # move robot by 1

    if @table.place(position[:x] + vector[:x], position[:y] + vector[:y])
      Messages.robot_action_confirm
    else
      Messages.off_table
    end
  end

  def report
    if @table.robot_present?
      position = @table.robot_position
      orientation = @robot.orientation
      Messages.report(position, orientation)
    else
      Messages.robot_not_placed
    end
  end

  def help
    Messages.introduction_instructions
  end


end
