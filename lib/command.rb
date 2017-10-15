require 'pry'
require_relative './robot'
require_relative './table'

class Command

  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def initiate
    loop do
      puts "Please enter a command..."
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
    when 'EXIT'
      exit
    else
      "Don't understand command"
    end

  end

  def place(arguments)
     arguments_split = arguments.split(",")
     x = arguments_split[0].to_i
     y = arguments_split[1].to_i
     orientation = arguments_split[2]

     @table.place(x,y)
     @robot.direction(orientation)
  end

  def left
    if @table.robot_present?
      @robot.left
    else
      puts "Robot not placed"
      return
    end
  end

  def right
    if @table.robot_present?
      @robot.right
    else
      puts "Robot not placed"
      return
    end
  end

  def move
    if @table.robot_present?
      vector = @robot.vector
      position = @table.robot_position
    end

    # move robot by 1
    if @table.place(position[:x] + vector[:x], position[:y] + vector[:y])
      nil
    else
      'Off table'
    end
  end

  def report
    if @table.robot_present?
      position = @table.robot_position
      orientation = @robot.orientation
      puts "#{position[:x]},#{position[:y]},#{orientation.to_s.upcase}"
    else
      puts "Robot not placed"
    end
  end


end
