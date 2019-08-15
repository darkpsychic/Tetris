require 'ruby2d'
require_relative 'lib/Tetromino/Zed'
require_relative 'lib/Block'
require_relative 'lib/Constant/Constant'
require_relative 'lib/Board'


set width: Constant::Width, height: Constant::Height

#draw horizontal lines
for i in 1..Constant::NumOfBlocksY do
    Line.new(x1: 0, y1: i*Constant::BlockSize, x2: Constant::Width, y2: i*Constant::BlockSize, width: Constant::LineSize, color: Constant::LineColor)
end

#draw vertical lines
for i in 1..Constant::NumOfBlocksX do
    Line.new(x1: i*Constant::BlockSize, y1: 0, x2: i*Constant::BlockSize, y2: Constant::Height, width: Constant::LineSize, color: Constant::LineColor)
end

t = Zed.new(x: 3, y: 3)
tick = 0
a1 = Square.new(color: 'random')
a2 = Square.new(color: 'random')
a3 = Square.new(color: 'random')
a4 = Square.new(color: 'random')
update do
    if tick%Window.fps==0
        on :key_up do |event|
            if event.key == 'return' 
                t.rotate
                puts "RETURN"
                if a1 != 0
                    a1.remove
                    a1 = Square.new(x: (t.get_shape[0].getX - 1)*Constant::BlockSize, y: (t.get_shape[0].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
                end
                if a2 != 0   
                    a2.remove
                    a2 = Square.new(x: (t.get_shape[1].getX - 1)*Constant::BlockSize, y: (t.get_shape[1].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
                end
                if a3 != 0
                    a3.remove
                    a3 = Square.new(x: (t.get_shape[2].getX - 1)*Constant::BlockSize, y: (t.get_shape[2].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
                end
                if a4 != 0
                    a4.remove
                    a4 = Square.new(x: (t.get_shape[3].getX - 1)*Constant::BlockSize, y: (t.get_shape[3].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
                end
            end 
        end
    end

    tick += 1
    
end

show