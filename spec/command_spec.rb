require_relative './spec_helper.rb'
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/command'
require_relative '../lib/messages'

describe 'taking commands' do

  context "when input is empty" do
    table = Table.new
    robot = Robot.new
    command = Command.new
    it "will be nil" do
      expect(command.execute("")).to be_nil
    end
  end

  context "when input is white space" do
    table = Table.new
    robot = Robot.new
    command = Command.new
    it "will be nil" do
      expect(command.execute("   ")).to be_nil
    end
  end

  context "when input is an invalid command" do
    table = Table.new
    robot = Robot.new
    command = Command.new
    it "will show an error message" do
      expect{command.execute("JUMP")}.to output("\n````ERROR````\nInvalid Command. Please try again or type HELP for instructions.\n").to_stdout
    end
  end

  context "when input is anything but PLACE and Invalid Command before placing robot" do
    table = Table.new
    robot = Robot.new
    command = Command.new

    it "will show an error message" do
      expect{command.execute("MOVE")}.to output("\n````ERROR````\nYou have not placed the Robot on the table yet. Try enter PLACE,X,Y,DIRECTION\n").to_stdout
    end
  end


end
