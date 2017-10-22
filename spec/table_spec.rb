require_relative './spec_helper.rb'
require_relative '../lib/table.rb'


describe 'Allow placement' do
  it "Can place robot on table if inside table bounds" do
    table = Table.new
    expect(table.place(2, 2)).not_to be_nil
    expect(table.place(1, 4)).not_to be_nil
  end
end

describe 'Invalid placement' do
  context "cannot place robot out of bounds" do

    table = Table.new

    it "cannot place robot if y > 5" do
      expect(table.place(1, 6)).to be_nil
    end

    it "cannot place robot if y < 0" do
      expect(table.place(1, -1)).to be_nil
    end

    it "cannot place robot if X > 5" do
      expect(table.place(6, 1)).to be_nil
    end

    it "cannot place robot if X < 0" do
      expect(table.place(-1, 3)).to be_nil
    end

  end
end

describe 'Is robot placed?' do
  context "on simulation start" do
    it 'returns false initially' do
      table = Table.new
      expect(table.robot_present?).to be false
    end
  end

  context "after placing robot" do
    it "should return true" do
      table = Table.new
      table.place(2,2)
      expect(table.robot_present?).to be true
    end
  end
end

describe 'Check robot position on table' do
  context "on simulation start" do
    it 'returns nil initially' do
      table = Table.new
      expect(table.robot_position).to be_nil
    end
  end

  context "after placing robot" do
    it "should return the x,y coordinates" do
      table = Table.new
      table.place(2,2)
      expect(table.robot_position).to eq(x: 2, y: 2)
    end
  end

  context "after an invalid placement" do
    it "should return nil" do
      table = Table.new
      table.place(2,6)
      expect(table.robot_position).to be_nil
    end
  end
end
