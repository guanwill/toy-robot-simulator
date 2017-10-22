require_relative './command'
include Messages

puts "\n~~~ WELCOME TO TOY ROBOT SIMULATION ~~~ \n\n"
toy_robot = Command.new
toy_robot.initiate
