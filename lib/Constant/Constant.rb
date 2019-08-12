module Constant
    #Screen Dimensions
    Width = 600.0
    Height = 720.0

    #Line Properties
    LineSize = 1.0
    LineColor = [0, 1, 0, 0.5] #green

    #Block Properties
    BlockSize = 40
    NumOfBlocksX = ((Width + LineSize) / (BlockSize + LineSize)).round
    NumOfBlocksY = ((Height + LineSize) / (BlockSize + LineSize)).round
end