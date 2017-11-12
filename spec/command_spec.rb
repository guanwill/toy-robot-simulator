require_relative './spec_helper.rb'
require_relative '../lib/table'
require_relative '../lib/robot'
require_relative '../lib/command'
require_relative '../lib/messages'

# describe 'initializing the game' do
#   let(:command) { Command.new }
#
#   it "will prompt for user input" do
#     expect(command.initiate).to eq ("\nPlease enter a command below...\n")
#   end
# end

describe 'taking commands before robot placement' do
  let(:table) { Table.new }
  let(:robot) { Robot.new }
  let(:command) { Command.new }

  context "when input is empty" do
    it "will be do nothing" do
      expect(command.execute("")).to be_nil
    end
  end

  context "when input is white space" do
    it "will do nothing" do
      expect(command.execute("   ")).to be_nil
    end
  end

  context "when input is an invalid command" do
    it "will show an error message" do
      expect{command.execute("JUMP")}.to output("\n````ERROR````\nInvalid Command. Please try again or type HELP for instructions.\n").to_stdout
    end
  end

  context "when input is MOVE before placing robot" do
    it "will show an error message" do
      expect{command.execute("MOVE")}.to output("\n````ERROR````\nYou have not placed the Robot on the table yet. Try enter PLACE,X,Y,DIRECTION\n").to_stdout
    end
  end

  context "when input is LEFT before placing robot" do
    it "will show an error message" do
      expect{command.execute("LEFT")}.to output("\n````ERROR````\nYou have not placed the Robot on the table yet. Try enter PLACE,X,Y,DIRECTION\n").to_stdout
    end
  end

  context "when input is RIGHT before placing robot" do
    it "will show an error message" do
      expect{command.execute("RIGHT")}.to output("\n````ERROR````\nYou have not placed the Robot on the table yet. Try enter PLACE,X,Y,DIRECTION\n").to_stdout
    end
  end

  context "when input is REPORT before placing robot" do
    it "will show an error message" do
      expect{command.execute("REPORT")}.to output("\n````ERROR````\nYou have not placed the Robot on the table yet. Try enter PLACE,X,Y,DIRECTION\n").to_stdout
    end
  end

  context "when input is PLACE with invalid coordinates" do
    it "will show an error message" do
      expect{command.execute("PLACE 6,6,NORTH")}.to output("\n````ERROR````\nInvalid placement. Please try again or type HELP for instructions.\n").to_stdout
    end
  end

  context "when input is PLACE with invalid direction" do
    it "will show an error message" do
      expect{command.execute("PLACE 2,2,DOWN")}.to output("\n````ERROR````\nInvalid placement. Please try again or type HELP for instructions.\n").to_stdout
    end
  end

  context "when input is PLACE with valid coordinates and direction" do
    it "will show a confirm message" do
      expect{command.execute("PLACE 2,2,NORTH")}.to output("\n````CONFIRM````\nRobot has been placed. You can enter REPORT to see current robot position\n").to_stdout
    end
  end
end

describe 'taking commands after robot placement' do
  let(:table) { Table.new }
  let(:robot) { Robot.new }
  let(:command) { Command.new }

  context "when input is LEFT after robot placement" do
    before do
      command.execute("PLACE 2,2,NORTH")
    end

    it "will show a confirm message" do
      expect{command.execute("LEFT")}.to output("\n````CONFIRM````\nRobot has moved. You can enter REPORT to see current robot position\n").to_stdout
    end
  end

  context "when input is RIGHT after robot placement" do
    before do
      command.execute("PLACE 2,2,NORTH")
    end

    it "will show a confirm message" do
      expect{command.execute("RIGHT")}.to output("\n````CONFIRM````\nRobot has moved. You can enter REPORT to see current robot position\n").to_stdout
    end
  end

  context "when input is REPORT after robot placement" do
    before do
      command.execute('PLACE 2,2,NORTH')
    end

    it "will display the robot's current position in X,Y,D format" do
      expect{command.execute('REPORT')}.to output("\n````ROBOT STATUS````\nPosition: 2,2,NORTH\n").to_stdout
      expect(command.execute('REPORT')).to eq "2,2,NORTH"
    end
  end

  context "when input is MOVE after robot placement and is within bounds" do
    before do
      command.execute('PLACE 2,2,NORTH')
    end

    it "will display a confirm message" do
      expect{command.execute('MOVE')}.to output("\n````CONFIRM````\nRobot has moved. You can enter REPORT to see current robot position\n").to_stdout
    end
  end

  context "when input is MOVE after robot placement and is out of bounds" do
    before do
      command.execute('PLACE 5,5,NORTH')
    end

    it "will display a confirm message" do
      expect{command.execute('MOVE')}.to output("\n````ERROR````\nYour robot will fall of the table. And die. And ressurect. Turn super saiyan. And blow up the earth.\n").to_stdout
    end
  end

  context "when input is PLACE after robot placement and is a valid placement" do
    before do
      command.execute('PLACE 5,5,NORTH')
    end

    it "will display a confirm message" do
      expect{command.execute("PLACE 2,2,NORTH")}.to output("\n````CONFIRM````\nRobot has been placed. You can enter REPORT to see current robot position\n").to_stdout
    end
  end

  context "when input is PLACE after robot placement and is an invalid placement" do
    before do
      command.execute('PLACE 5,5,NORTH')
    end

    it "will display a confirm message" do
      expect{command.execute("PLACE 6,6,NORTH")}.to output("\n````ERROR````\nInvalid placement. Please try again or type HELP for instructions.\n").to_stdout
    end
  end
end

describe "when input is HELP" do
  let(:command) { Command.new }
  it "will show instructions" do
    expect{command.help}.to output(
      "---------------------------\nINSTRUCTIONS\n---------------------------\nYour key commands are PLACE, MOVE, LEFT, RIGHT, REPORT, HELP, and EXIT.\n\n--- PLACE X,Y,D ---\nIt will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. Example: PLACE 2,2,NORTH\n\n--- MOVE ---\nIt will move the toy robot one unit forward in the direction it is currently facing.\n\n--- LEFT ---\nIt will rotate the robot 90 degrees in the specified direction without changing the position of the robot.\n\n--- RIGHT ---\nIt will rotate the robot 90 degrees in the specified direction without changing the position of the robot.\n\n--- REPORT ---\nIt will announce the X,Y and F of the robot.\n\n--- HELP ---\nIt will display the instructions.\n\n--- EXIT ---\nIt will exit the application\n"
    ).to_stdout
  end
end
