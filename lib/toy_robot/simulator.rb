module ToyRobot
  class Simulator
    attr_reader :robot
    
    def initialize(table)
      @table = table
    end

    def place(east, north, facing)
      return unless @table.valid_location?(east,north)
        @robot = Robot.new(east, north, facing)
    end

    def isPlaced?
      !robot.nil?
    end

    def move
      return unless isPlaced?
      return unless @table.valid_location?(*robot.next_move)
      robot.move
    end

    def turn_left
      return unless isPlaced?
      robot.turn_left
    end

    def turn_right
      return unless isPlaced?
      robot.turn_right
    end

    def report
      return unless isPlaced?
      position = robot.report
      puts "Robot is currently at (#{position[:east]}, #{position[:north]})" + " facing #{position[:direction]}"
    end

    def invalid(command)
      puts "'#{command.strip}' is not a valid command"
    end
  end
end