require_relative "../Block"
require_relative "../Constant/Constant"

class Shape
    #constructor: create a shape with the top-left block is at position (x, y)
    def initialize(x: 0, y: 0)
        @block_arr = [Block.new(x: 0, y: 0, size: Constant::BlockSize, rgba: [0.5, 0.5, 0.5, 0.5]), 
                      Block.new(x: 0, y: 0, size: Constant::BlockSize, rgba: [0.5, 0.5, 0.5, 0.5]),
                      Block.new(x: 0, y: 0, size: Constant::BlockSize, rgba: [0.5, 0.5, 0.5, 0.5]),
                      Block.new(x: 0, y: 0, size: Constant::BlockSize, rgba: [0.5, 0.5, 0.5, 0.5])]
        @x = x
        @y = y
    end

    def move_left() 
        @block_arr.each do |block|
            @x -= 1
        end
    end

    def move_right() 
        @block_arr.each do |block|
            @x += 1
        end
    end

    def move_down() 
        @block_arr.each do |block|
            @y += 1
        end
    end

    def get_shape()
        @block_arr
    end
end