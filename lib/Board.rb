require_relative "Constant/Constant"
require_relative "Tetromino/Tetromino"

class Board 
    def initialize()
        # stores the value of each position in a 2d array
        # value is a number in the range [0, 6]
        @board = Array.new(Constant::NumOfBlocksY) {Array.new(Constant::NumOfBlocksX, 0)}
    end

    # generates a random block at the top of the screen
    def drop()
        random_number = rand(1..6)

        @cur_shape = 0 #placeholder value

        midX = Constant::NumOfBlocksX/2
        midY = 0
        case random_number
        when 1
            @cur_shape = Box.new(x: midX, y: midY)
        when 2
            @cur_shape = Jed.new(x: midX, y: midY)
        when 3
            @cur_shape = Led.new(x: midX, y: midY)
        when 4
            @cur_shape = Stick.new(x: midX, y: midY)
        when 5
            @cur_shape = Tee.new(x: midX, y: midY)
        when 6
            @cur_shape = Zed.new(x: midX, y: midY)
        end

        puts random_number
        
        @cur_shape
    end
end