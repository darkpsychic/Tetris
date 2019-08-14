require_relative "Block"
require_relative "Shape"
require_relative "Constant/Constant"

class Led < Shape
    def initialize(x: 0, y: 0) 
        if x>Constant::NumOfBlocksX-3 or x<0 or y>Constant::NumOfBlocksY-2 or y<0
            raise "Invalid positions"
        end

        super

        @rotation_state = 0  #stores the current state of rotation 
        @num_of_rotations = 3 #number of possible rotations for the piece

        rotate
    end 

    def rotate
        if @rotation_state == 0 
            rotate_top
        elsif @rotation_state == 1
            rotate_bottom
        elsif @rotation_state == 2
            rotate_left
        end

        @rotation_state += 1
        @rotation_state %= @num_of_rotations
    end

    private 

    def rotate_top 
        @block_arr[0].set(@x, @y)
        @block_arr[1].set(@x, @y+1)
        @block_arr[2].set(@x+1, @y+1)
        @block_arr[3].set(@x+2, @y+1)
    end

    def rotate_bottom
        @block_arr[0].set(@x, @y)
        @block_arr[1].set(@x+1, @y)
        @block_arr[2].set(@x+2, @y)
        @block_arr[3].set(@x+2, @y+1)
    end

    def rotate_left
        @block_arr[0].set(@x, @y)
        @block_arr[1].set(@x+1, @y)
        @block_arr[2].set(@x, @y+1)
        @block_arr[3].set(@x, @y+2)
    end
end 