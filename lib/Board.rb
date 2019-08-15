require_relative "Constant/Constant"
require_relative "Tetromino/Tetromino"

class Board 
    def initialize()
        # stores the value of each position in a 2d array
        # value is a number in the range [0, 6]
        @board = Array.new(Constant::NumOfBlocksY) {Array.new(Constant::NumOfBlocksX, 0)}

        @game_lost = false
        @score = 0
    end

    # generates a random block at the top of the screen
    def drop()
        random_number = rand(1..6)

        @cur_shape = 0 #placeholder value
        @cur_shape_symbol = 0

        midX = Constant::NumOfBlocksX/2
        midY = 0
        case random_number
        when 1
            @cur_shape_symbol = :Box
            @cur_shape = Box.new(x: midX, y: midY)
        when 2
            @cur_shape_symbol = :Jed
            @cur_shape = Jed.new(x: midX, y: midY)
        when 3
            @cur_shape_symbol = :Led
            @cur_shape = Led.new(x: midX, y: midY)
        when 4
            @cur_shape_symbol = :Stick
            @cur_shape = Stick.new(x: midX, y: midY)
        when 5
            @cur_shape_symbol = :Tee
            @cur_shape = Tee.new(x: midX, y: midY)
        when 6
            @cur_shape_symbol = :Zed
            @cur_shape = Zed.new(x: midX, y: midY)
        end

        puts @cur_shape_symbol

        if !gameover?
            add_shape(@cur_shape, @cur_shape_symbol)
        else
            @game_lost = true
        end

        @cur_shape
    end

    # checks for collision of the given shape with blocks on the board
    def colliding?(shape)
        shape.get_shape.each do |cur_block|
            if @board[cur_block.getY][cur_block.getX] != 0
                return true
            end
        end

        return false
    end

    # checks if there is any collision with the roof i.e. checks if the game is over
    def gameover?
        if colliding?(@cur_shape)
            return true
        else
            return false
        end
    end

    private 

    def add_shape(shape, shape_symbol)
        shape.get_shape.each do |block|
            @board[block.getX][block.getY] = shape_symbol
        end
    end
end