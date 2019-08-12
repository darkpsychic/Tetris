class Block
    def initialize(x: 0, y: 0, size: 10, rgba: [1, 1, 1, 1])
        @x = x
        @y = y
        @size = size
        @rgba = rgba
    end

    def getX()
        @x 
    end

    def getY()
        @y 
    end

    def getSize()
        @size
    end

    def getColor()
        @rgba
    end

    def setX(x)
        @x = x 
    end 

    def setY(y) 
        @y = y 
    end 

    def setColor(rgba: [1, 1, 1, 1]) 
        @rgba = rgba 
    end
end