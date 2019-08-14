require 'ruby2d'
require_relative 'lib/Stick'
require_relative 'lib/Jed'
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

t = Jed.new(x: 3, y: 3)
#t.rotate
#t.rotate
tick = 0
a1 = 0
a2 = 0
a3 = 0
a4 = 0
update do
    on :key do |event|
        if event.key == 'return' 
            puts "RETURN"
            a1 = Square.new(x: (t.get_shape[0].getX - 1)*Constant::BlockSize, y: (t.get_shape[0].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
            a2 = Square.new(x: (t.get_shape[1].getX - 1)*Constant::BlockSize, y: (t.get_shape[1].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
            a3 = Square.new(x: (t.get_shape[2].getX - 1)*Constant::BlockSize, y: (t.get_shape[2].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
            a4 = Square.new(x: (t.get_shape[3].getX - 1)*Constant::BlockSize, y: (t.get_shape[3].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
        end 

        if event.key == 'a'
            puts a1
            a1.remove
            a2.remove
            a3.remove
            a4.remove
            clear
            t.rotate
        end
    end

    tick += 1
    
end

show