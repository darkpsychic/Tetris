require 'ruby2d'
require_relative 'lib/Tee'
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

=begin
t = Tee.new(x: 3, y: 3)
t.rotate
t.rotate
t.rotate
t.rotate
for j in 1..1
    for i in 0..3
        puts "(#{t.get_shape[i].getX}, #{t.get_shape[i].getY})"
        Square.new(x: (t.get_shape[i].getX - 1)*Constant::BlockSize, y: (t.get_shape[i].getY - 1)*Constant::BlockSize, size: Constant::BlockSize, z:-1)
    end
    
    puts ""

    t.rotate
end
=end

show