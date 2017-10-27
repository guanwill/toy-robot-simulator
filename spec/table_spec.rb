require_relative './spec_helper.rb'
require_relative '../lib/table.rb'


describe 'Allow placement' do
  let(:table) { Table.new }

  it "Can place robot on table if inside table bounds" do
    expect(table.place(2, 2)).not_to be_nil
    expect(table.place(1, 4)).not_to be_nil
  end
end

describe 'Invalid placement' do
  let(:table) { Table.new }

  context "cannot place robot out of bounds" do
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
  let(:table) { Table.new }

  context "on simulation start" do
    it 'returns false initially' do
      expect(table.robot_present?).to be false
    end
  end

  context "after placing robot" do
    before do
      table.place(2,2)
    end
    it "should return true" do
      expect(table.robot_present?).to be true
    end
  end
end

describe 'Get robot position on table' do
  let(:table) { Table.new }

  context "on simulation start" do
    it 'returns nil initially' do
      expect(table.robot_position).to be_nil
    end
  end

  context "after placing robot" do
    before do
      table.place(2,2)
    end
    it "should return the x,y coordinates" do
      expect(table.robot_position).to eq(x: 2, y: 2)
    end
  end

  context "after an invalid placement" do
    before do
      table.place(2,6)
    end
    it "should return nil" do
      expect(table.robot_position).to be_nil
    end
  end
end
