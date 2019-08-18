module Constant
    #Screen Dimensions
    Width = 600.0
    Height = 720.0

    #Line Properties
    LineSize = 1.0
    LineColor = [0.6, 0.4, 0.6, 1] 

    #Block Properties
    BlockSize = 40
    NumOfBlocksX = ((Width + LineSize) / (BlockSize + LineSize)).round
    NumOfBlocksY = ((Height + LineSize) / (BlockSize + LineSize)).round

    BoxColor =  [0.8, 0.8, 0, 1]     #Yellow
    JedColor =  [0.8, 0.4, 0, 1]     #Orange
    LedColor =  [0, 0, 1, 1]         #Blue
    StickColor = [0, 0.8, 0.8, 1]    #Cyan
    TeeColor =  [0.46, 0.3, 0.47, 1] #Lavender
    ZedColor = [0, 1, 0, 1]          #Green

    FPS = 60
end