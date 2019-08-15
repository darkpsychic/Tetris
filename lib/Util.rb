require 'ruby2d'
require_relative 'Constant/Constant'

module Util
    extend self

    def update(board, cur_shape)
        Window.on :key_down do |event|
            if event.key=="up"
                cur_shape.rotate
                board.add_shape(cur_shape)
            elsif event.key=="left"
                cur_shape.move_left
                board.add_shape(cur_shape)
            elsif event.key=="right"
                cur_shape.move_right
                board.add_shape(cur_shape)
            end
        end
    end

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
end