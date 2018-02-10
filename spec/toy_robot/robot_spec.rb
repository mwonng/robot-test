$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "spec_helper"

RSpec.describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new(0) }

  it "moves 3 spaces east" do
    3.times { subject.move_east }
    expect(subject.east).to eq(3)
  end
  
  it "moves 3 spaces west" do
    3.times { subject.move_west }
    expect(subject.east).to eq(-3)
  end
  
  it "moves 3 spaces north" do
    3.times { subject.move_north }
    expect(subject.north).to eq(3)
  end


  it "moves 3 spaces south" do
    3.times { subject.move_south }
    expect(subject.north).to eq(-3)
  end

  context "Facing north" do
    subject { ToyRobot::Robot.new(0,0,"NORTH") }

    it "move north" do
      subject.move
      expect(subject.north).to eq(1)
    end
  end

  context "Facing south" do
    subject { ToyRobot::Robot.new(0,0,"SOUTH") }

    it "move south" do
      subject.move
      expect(subject.north).to eq(-1)
    end
  end

  context "Facing east" do
    subject { ToyRobot::Robot.new(0,0,"EAST") }

    it "move east" do
      subject.move
      expect(subject.east).to eq(1)
    end
  end

  context "Facing west" do
    subject { ToyRobot::Robot.new(0,0,"WEST") }

    it "move west" do
      subject.move
      expect(subject.east).to eq(-1)
    end
  end
end
