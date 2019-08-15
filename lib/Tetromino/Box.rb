require_relative "../Block"
require_relative "Shape"
require_relative "../Constant/Constant"

class Box < Shape
    def initialize(x: 0, y: 0) 
        if x>Constant::NumOfBlocksX-2 or x<0 or y>Constant::NumOfBlocksY-2 or y<0
            raise "Invalid positions"
        end

        super

        @rotation_state = 0  #stores the current state of rotation 
        @num_of_rotations = 1 #number of possible rotations for the piece

        rotate
    end 

    def rotate
        @block_arr[0].set(@x, @y)
        @block_arr[1].set(@x+1, @y)
        @block_arr[2].set(@x, @y+1)
        @block_arr[3].set(@x+1, @y+1)
    end
end