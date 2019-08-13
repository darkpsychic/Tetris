require_relative "Block"
require_relative "Constant/Constant"

class Shape
    #constructor: create a shape with the top-left block is at position (x, y)
    def initialize(x: 0, y: 0)
        @block_arr = Array.new(4, Block.new(x: 0, y: 0, size: Constant::BlockSize, rgba: [0.5, 0.5, 0.5, 0.5]))
        @x = x
        @y = y
    end

    def move_left() 
        if @block_arr.getX() > 0
            @x -= 1
        end
    end

    def move_right() 
        if @block_arr.getX() < Constant::NumOfBlocksX - 1
            @x += 1
        end
    end
    
    def move_up() 
        if @block_arr.getY() > 0 
            @y -= 1
        end
    end

    def move_down() 
        if @block_arr.getY() < Constant::NumOfBlocksY - 1
            @y += 1
        end
    end

    def get_shape()
        @block_arr
    end
end