require_relative './spec_helper.rb'
require_relative '../lib/robot.rb'

describe 'To test robot orientation movement' do
  context "robot turns to the left" do
    it 'turns 90 degree from specified direction' do
      robot = Robot.new
      robot.direction("NORTH")
      expect(robot.left).to eq "WEST"
    end
  end

  context "robot turns to the right" do
    it 'turns 90 degree from specified direction' do
      robot = Robot.new
      robot.direction("NORTH")
      expect(robot.right).to eq "EAST"
    end
  end
end

describe 'To validate robot direction' do
  it 'allows robot to face north' do
    robot = Robot.new
    expect(robot.direction("NORTH")).not_to be_nil
  end

  it 'allows robot to face east' do
    robot = Robot.new
    expect(robot.direction("EAST")).not_to be_nil
  end

  it 'allows robot to face SOUTH' do
    robot = Robot.new
    expect(robot.direction("SOUTH")).not_to be_nil
  end

  it 'allows robot to face west' do
    robot = Robot.new
    expect(robot.direction("WEST")).not_to be_nil
  end

  it 'disallows robot to face a direction that is not north, south, east, or west' do
    robot = Robot.new
    expect(robot.direction("DOWN")).to eq false
  end
end


describe 'check robots orientation' do
  it 'is initially nil' do
    robot = Robot.new
    expect(robot.orientation).to be_nil
  end

  context 'after valid orientation' do
    it 'returns the orientation' do
      robot = Robot.new
      robot.direction("NORTH")
      expect(robot.orientation).to eq("NORTH")
    end
  end
end


describe 'vector' do
  context 'movement when facing north' do
    it 'y goes up by 1' do
      robot = Robot.new
      robot.direction("NORTH")
      expect(robot.vector).to eq(x: 0, y: 1)
    end
  end

  context 'movement when facing south' do
    it 'y goes down by 1' do
      robot = Robot.new
      robot.direction("SOUTH")
      expect(robot.vector).to eq(x: 0, y: -1)
    end
  end

  context 'movement when facing east' do
    it 'x goes up by 1' do
      robot = Robot.new
      robot.direction("EAST")
      expect(robot.vector).to eq(x: 1, y: 0)
    end
  end

  context 'movement when facing west' do
    it 'x goes down by 1' do
      robot = Robot.new
      robot.direction("WEST")
      expect(robot.vector).to eq(x: -1, y: 0)
    end
  end
end
