require 'ruby2d'
require_relative 'lib/Block'
require_relative 'lib/Constant/Constant'
require_relative 'lib/Board'

set width: Constant::Width, height: Constant::Height

#draw vertical lines
for i in 1..Constant::NumOfBlocksX do
    Line.new(x1: 0, y1: i*Constant::BlockSize, x2: Constant::Width, y2: i*Constant::BlockSize, width: Constant::LineSize, color: Constant::LineColor)
end

#draw horizontal lines
for i in 1..Constant::NumOfBlocksY do
    Line.new(x1: i*Constant::BlockSize, y1: 0, x2: i*Constant::BlockSize, y2: Constant::Height, width: Constant::LineSize, color: Constant::LineColor)
end

show