require_relative "../Block"
require_relative "../Constant/Constant"

class Shape
    #constructor: create a shape with the top-left block is at position (x, y)
    def initialize(x: 0, y: 0)
        @block_arr = [Block.new(x: 0, y: 0, size: Constant::BlockSize), 
                      Block.new(x: 0, y: 0, size: Constant::BlockSize),
                      Block.new(x: 0, y: 0, size: Constant::BlockSize),
                      Block.new(x: 0, y: 0, size: Constant::BlockSize)]
        @x = x
        @y = y
    end

    def move_left() 
        @x -= 1
        @block_arr.each do |block|
            block.setX(block.getX - 1)
        end
    end

    def move_right() 
        @x += 1
        @block_arr.each do |block|
            block.setX(block.getX + 1)
        end
    end

    def move_down() 
        @y += 1
        @block_arr.each do |block|
            block.setY(block.getY + 1)
        end
    end

    def move_up() 
        @y -= 1
        @block_arr.each do |block|
            block.setY(block.getY - 1)
        end
    end

    def get_shape()
        @block_arr
    end

    def get_symbol()
        @block_arr[0].getBlockSymbol
    end
end