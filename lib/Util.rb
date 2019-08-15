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

        for r in 0..Constant::NumOfBlocksY-1 do
            for c in 0..Constant::NumOfBlocksX-1 do
                cur_elem = board[r][c]

                cur_block = Square.new(x: c* Constant::BlockSize, y: r*Constant::BlockSize, size: Constant::BlockSize)
                case cur_elem
                    when 0
                        cur_block.color = 'black'
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
                end
            end
        end
    end
end