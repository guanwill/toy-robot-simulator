require_relative './spec_helper.rb'
require_relative '../lib/robot.rb'

describe 'To test robot orientation movement' do
  let(:robot) { Robot.new }

  context "robot turns to the left" do
    before do
      robot.direction("NORTH")
    end
    it 'turns 90 degree from specified direction' do
      expect(robot.left).to eq "WEST"
    end
  end

  context "robot turns to the right" do
    before do
      robot.direction("NORTH")
    end
    it 'turns 90 degree from specified direction' do
      expect(robot.right).to eq "EAST"
    end
  end
end

describe 'To validate robot direction' do
  let(:robot) { Robot.new }

  it 'allows robot to face north' do
    expect(robot.direction("NORTH")).not_to be_nil
  end

  it 'allows robot to face east' do
    expect(robot.direction("EAST")).not_to be_nil
  end

  it 'allows robot to face SOUTH' do
    expect(robot.direction("SOUTH")).not_to be_nil
  end

  it 'allows robot to face west' do
    expect(robot.direction("WEST")).not_to be_nil
  end

  it 'disallows robot to face a direction that is not north, south, east, or west' do
    expect(robot.direction("DOWN")).to eq false
  end
end


describe 'check robots orientation' do
  let(:robot) { Robot.new }

  it 'is initially nil' do
    expect(robot.orientation).to be_nil
  end

  context 'after valid orientation' do
    before do
      robot.direction("NORTH")
    end
    it 'returns the orientation' do
      expect(robot.orientation).to eq("NORTH")
    end
  end
end

describe 'vector' do
  let(:robot) { Robot.new }

  context 'movement when facing north' do
    before do
      robot.direction("NORTH")
    end
    it 'y goes up by 1' do
      expect(robot.vector).to eq(x: 0, y: 1)
    end
  end

  context 'movement when facing south' do
    before do
      robot.direction("SOUTH")
    end
    it 'y goes down by 1' do
      expect(robot.vector).to eq(x: 0, y: -1)
    end
  end

  context 'movement when facing east' do
    before do
      robot.direction("EAST")
    end
    it 'x goes up by 1' do
      expect(robot.vector).to eq(x: 1, y: 0)
    end
  end

  context 'movement when facing west' do
    before do
      robot.direction("WEST")
    end
    it 'x goes down by 1' do
      expect(robot.vector).to eq(x: -1, y: 0)
    end
  end
end
