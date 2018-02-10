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

  context "when facing north" do
    subject { ToyRobot::Robot.new(0,0,"NORTH") }

    it "move north" do
      subject.move
      expect(subject.north).to eq(1)
    end
    
    it "north and turn left" do
      subject.turn_left
      expect(subject.direction).to eq("WEST")
    end 

    it "north and turn right" do
      subject.turn_right
      expect(subject.direction).to eq("EAST")
    end 

  end

  context "when facing south" do
    subject { ToyRobot::Robot.new(0,0,"SOUTH") }

    it "move south" do
      subject.move
      expect(subject.north).to eq(-1)
    end

    it "south and turn left" do
      subject.turn_left
      expect(subject.direction).to eq("EAST")
    end 

    it "south and turn right" do
      subject.turn_right
      expect(subject.direction).to eq("WEST")
    end 
  end

  context "when facing east" do
    subject { ToyRobot::Robot.new(0,0,"EAST") }

    it "move east" do
      subject.move
      expect(subject.east).to eq(1)
    end

    it "east and turn left" do
      subject.turn_left
      expect(subject.direction).to eq("NORTH")
    end 

    it "east and turn right" do
      subject.turn_right
      expect(subject.direction).to eq("SOUTH")
    end 
  end

  context "when facing west" do
    subject { ToyRobot::Robot.new(0,0,"WEST") }

    it "move west" do
      subject.move
      expect(subject.east).to eq(-1)
    end

    it "west and turn left" do
      subject.turn_left
      expect(subject.direction).to eq("SOUTH")
    end 

    it "west and turn right" do
      subject.turn_right
      expect(subject.direction).to eq("NORTH")
    end 
  end

end
