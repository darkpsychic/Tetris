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

    BoxColor =  [0, 0, 1, 0.5]      #Blue
    JedColor =  [0, 0.6, 0.4, 0.5]  #Jade
    LedColor =  [0.9, 0.9, 1, 0.5]  #Lavender
    StickColor = [0, 0.1, 0.4, 0.5] #Sapphire
    TeeColor =  [0, 0.5, 0.5, 0.5]  #Teal
    ZedColor = [0.8, 0.7, 0.1, 0.5] #Zutem
end