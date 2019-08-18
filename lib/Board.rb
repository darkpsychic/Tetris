require_relative 'Util'
require_relative "Constant/Constant"
require_relative "Tetromino/Tetromino"

class Board 
    def initialize()
        # stores the value of each position in a 2d array
        @board = Array.new(Constant::NumOfBlocksY) {Array.new(Constant::NumOfBlocksX, 0)}

        @game_lost = false
        @should_fall = true
        @score = 0

        @score_text = Text.new("Score: #{@score}", x:10, y:10, size:40, z:10, color:"white")
        @gameover_text = Text.new("Gameover", x: 50, y: Constant::Height/2 - 50, size: 100, color: 'red', z:100)
        @gameover_text.remove

        @time = 0

        @CUR_FPS = Constant::FPS

        init_input
    end

    def get_score
        @score
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
        if !@game_lost
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

                    add_shape @cur_shape

                    @score += clear_line
                    @score_text.text = "Score: #{@score}"
                end

                add_shape @cur_shape
            end

            Util.draw(@board, @score_text)

            @time += 1

        else
            @gameover_text.add
        end
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

    def remove_shape(shape)
        shape.get_shape.each do |block|
            @board[block.getY][block.getX] = 0
        end
    end

    def add_shape(shape)
        shape.get_shape.each do |block|
            @board[block.getY][block.getX] = shape.get_symbol
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
                @board.delete_at(i)
                @board.unshift(Array.new(Constant::NumOfBlocksX, 0))
            end

            i += 1
        end

        return score
    end
end