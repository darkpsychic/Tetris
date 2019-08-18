require 'ruby2d'
require_relative 'Constant/Constant'

module Util
    extend self

    def draw_lines
        #draw horizontal lines
        for i in 1..Constant::NumOfBlocksY do
            Line.new(x1: 0, y1: i*Constant::BlockSize, x2: Constant::Width, y2: i*Constant::BlockSize, width: Constant::LineSize, color: Constant::LineColor)
        end

        #draw vertical lines
        for i in 1..Constant::NumOfBlocksX do
            Line.new(x1: i*Constant::BlockSize, y1: 0, x2: i*Constant::BlockSize, y2: Constant::Height, width: Constant::LineSize, color: Constant::LineColor)
        end
    end

    def draw(board)
        Window.clear

        draw_lines

        for r in 0..Constant::NumOfBlocksX-1 do
            for c in 0..Constant::NumOfBlocksY-1 do
                cur_elem = board[r][c]

                cur_block = Square.new(x: r*Constant::BlockSize, y: c*Constant::BlockSize, size: Constant::BlockSize, z: -1)
                case cur_elem
                    when :Box 
                        cur_block.color = Constant::BoxColor
                    when :Jed
                        cur_block.color = Constant::JedColor
                    when :Led
                        cur_block.color = Constant::LedColor
                    when :Stick
                        cur_block.color = Constant::StickColor
                    when :Tee
                        cur_block.color = Constant::TeeColor
                    when :Zed
                        cur_block.color = Constant::ZedColor
                    else
                        cur_block.color = [0, 0, 0, 1]
                end
            end
        end
    end

    #returns true if the shape is out of bounds
    def out_of_bounds?(shape)
        shape.get_shape.each do |block|
            if block.getX >= Constant::NumOfBlocksX or block.getX < 0 or
                block.getY >= Constant::NumOfBlocksY or block.getY < 0 
                puts block.getX 
                return true
            end
        end

        return false;
    end

    # returns true if there is a filled line
    def clear_line?(board)
        
    end
end