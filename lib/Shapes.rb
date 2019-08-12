require "Block"
require_relative "Constant/Constant"

class Shapes 
    #constructor: create a shape with the top-left block is at position (x, y)
    def initialize(x: 0, y: 0) do 
        @block_arr = Array.new(4, Block.new(0, 0, Constant::BlockSize, color: [0.5, 0.5, 0.5, 0.5]))
        @x = x
        @y = y
    end

    def move_left() do 
        if @block_arr.getX() > 0
            @x -= 1
        end

    def move_right() do 
        if @block_arr.getX() < Constant::NumOfBlocksX - 1
            @x += 1
        end
    
    def move_up() do
        if @block_arr.getY() > 0 
            @y -= 1
        end

    def move_down() do 
        if @block_arr.getY() < Constant::NumOfBlocksY - 1
            @y += 1
        end
end