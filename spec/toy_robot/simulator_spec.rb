require "spec_helper"

RSpec.describe ToyRobot::Simulator do
  let(:table) { ToyRobot::Table.new(5,5) }
  subject {ToyRobot::Simulator.new(table) }

  it "place the robot on a valid position" do
    expect(ToyRobot::Robot).to receive(:new)
      .with(0, 0, "NORTH")
      .and_return(double)
    subject.place(0, 0, "NORTH")
    expect(subject.robot).not_to be_nil
  end

  it "cannot place the robot on a invalid position" do
    expect(ToyRobot::Robot).not_to receive(:new)
    subject.place(5, 5, "NORTH")
    expect(subject.robot).to be_nil
  end
  
  it "does not have robot placed yet" do
    expect(subject.isPlaced?).to eq(false)
  end

  it "should not move the robot" do
    expect { subject.move }.to_not raise_error
  end

  context "after placed" do
    let(:robot) { instance_double(ToyRobot::Robot, next_move: [0,0]) }
    before { allow(subject).to receive(:robot).and_return(robot) }

    it "already placed a robot " do
      expect(subject.isPlaced?).to eq(true)
    end

    it "receive move command" do
      expect(robot).to receive(:move)
      subject.move
    end

    it "receive left command" do
      expect(robot).to receive(:turn_left)
      subject.turn_left
    end

    it "receive left command" do
      expect(robot).to receive(:turn_right)
      subject.turn_right
    end

    it "receive report command" do
      expect(robot).to receive(:report) {{ north:3, east:3, direction:"NORTH"}}
      subject.report
    end
  end

  context "place at boundary" do
    before do 
      subject.place(0, 4, "NORTH")
    end

    it "cannot move past the table boundary" do
      subject.move
      message = "Robot is currently at (0, 4) facing NORTH\n"
      expect { subject.report }.to output(message).to_stdout
    end
  end

  it "turning an unplaced robot left does not cause an exception" do
    expect { subject.turn_left }.to_not raise_error
  end
  
  it "turning an unplaced robot right does not cause an exception" do
    expect { subject.turn_right }.to_not raise_error
  end
  
  it "asking an unplaced robot to report does not cause an exception" do
    expect { subject.turn_right }.to_not raise_error
  end
  
  it "warning if command is not valid" do
    message = "'PLACE 0, 2, NORTH' is not a valid command\n"
    expect { subject.invalid("PLACE 0, 2, NORTH")}.to output(message).to_stdout
  end
end