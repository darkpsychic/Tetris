require_relative 'Util'
require_relative "Constant/Constant"
require_relative "Tetromino/Tetromino"

class Board 
    def initialize()
        # stores the value of each position in a 2d array
        # value is a number in the range [0, 6]
        @board = Array.new(Constant::NumOfBlocksX) {Array.new(Constant::NumOfBlocksY, 0)}

        @game_lost = false
        @should_fall = true
        @score = 0

        @time = 0

        @CUR_FPS = Constant::FPS

        init_input
    end

    def init_input 
        Window.on :key_held do |event|
            if event.key == "down"
                @CUR_FPS = Constant::FPS / 8
            end
        end

        Window.on :key_up do |event|
            if event.key == "down"
                @CUR_FPS = Constant::FPS
            end
        end

        Window.on :key_down do |event|
            if event.key == "left"
                remove_shape @cur_shape
                @cur_shape.move_left

                if Util.out_of_bounds? @cur_shape or colliding?(@cur_shape)
                    @cur_shape.move_right 
                end

                add_shape @cur_shape

            elsif event.key == "right"
                remove_shape @cur_shape
                @cur_shape.move_right

                if Util.out_of_bounds? @cur_shape or colliding?(@cur_shape)
                    @cur_shape.move_left
                end

                add_shape @cur_shape

            elsif event.key == "up"
                remove_shape @cur_shape
                @cur_shape.rotate

                if Util.out_of_bounds?(@cur_shape) or colliding?(@cur_shape)
                    @cur_shape.rotate_reverse
                end

                add_shape @cur_shape
            end
        end
    end

    def run()
        if @time % @CUR_FPS == 0
            @time = 0
            
            if @should_fall 
                drop
                @should_fall = false;
            end

            remove_shape @cur_shape
            @cur_shape.move_down

            if Util.out_of_bounds? @cur_shape or colliding?(@cur_shape)
                p @board
                @cur_shape.move_up
                @should_fall = true
            end

            add_shape @cur_shape

            clear_line
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

    # returns the score to be added and removes filled lines
    def clear_line()
        score = 0
        i = 0
        for row in @board
            flag = true
            for elem in row
                if elem == 0
                    flag = false
                    break
                end
            end

            if flag
                score += 100
                remove_line(i)
            end

            i += 1
        end

        return score
    end

    private

    def remove_line(i)
        (i-1).downto(0) do |row|
            for col in 0..Constant::NumOfBlocksX
                flag = true
                for block in @cur_shape.get_shape
                    if block.getX == col and block.getY == row
                        flag = false
                        break
                    end
                end

                if flag and @board[row][col] != 0
                    @board[row+1][col] = @board[row][col]
                    @board[row][col] = 0
                end
            end
        end
    end
end