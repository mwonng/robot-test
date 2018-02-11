module ToyRobot

  class Table
    def initialize(width, lenght)
      @width = width
      @lenght = lenght
    end
    
    def valid_location?(east, north)
      east >=0 && east < @width && north >= 0 && north < @lenght
    end


  end
  
end