require_relative 'Util'
require_relative "Constant/Constant"
require_relative "Tetromino/Tetromino"

class Board 
    def initialize()
        # stores the value of each position in a 2d array
        # value is a number in the range [0, 6]
        @board = Array.new(Constant::NumOfBlocksY) {Array.new(Constant::NumOfBlocksX, 0)}

        @game_lost = false
        @should_fall = true
        @score = 0

        @time = 0
    end

    def run()
        if @time % 60 == 0
            @time = 0
            
            if @should_fall 
                drop
                @should_fall = false;
            end

            Window.on :key_down do |event|
                if event.key == "left"
                    remove_shape @cur_shape
                    @cur_shape.move_left

                    if Util.out_of_bounds? @cur_shape
                        @cur_shape.move_right 
                    end

                    add_shape @cur_shape

                elsif event.key == "right"
                    remove_shape @cur_shape
                    @cur_shape.move_right

                    if Util.out_of_bounds? @cur_shape
                        @cur_shape.move_left
                    end

                    add_shape @cur_shape
                end
            end

            remove_shape @cur_shape
            @cur_shape.move_down

            if Util.out_of_bounds? @cur_shape
                @cur_shape.move_up
                @should_fall = true
            end

            add_shape @cur_shape
        end

        Util.draw(@board)

        @time += 1
    end

    # generates a random block at the top of the screen
    def drop()
        random_number = rand(1..6)

        @cur_shape = 0 #placeholder value
        @cur_shape_symbol = 0

        midX = Constant::NumOfBlocksX/2 - 1
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

        if !gameover?
            add_shape(@cur_shape)
        else
            @game_lost = true
        end
    end

    # checks for collision of the given shape with blocks on the board
    def colliding?(shape)
        shape.get_shape.each do |cur_block|
            if @board[cur_block.getX][cur_block.getY] != 0
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

    def remove_shape(shape)
        shape.get_shape.each do |block|
            @board[block.getX][block.getY] = 0
        end
    end

    def add_shape(shape)
        shape.get_shape.each do |block|
            @board[block.getX][block.getY] = shape.get_symbol
        end 
    end
end