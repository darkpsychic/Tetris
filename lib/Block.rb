class Block
    def initialize(x: 0, y: 0, size: 40, block_symbol: :none)
        @x = x
        @y = y
        @size = size
        @block_symbol = block_symbol
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

    def getBlockSymbol()
        @block_symbol
    end

    def set(x, y)
        @x = x 
        @y = y
    end

    def setX(x)
        @x = x 
    end 

    def setY(y) 
        @y = y 
    end 

    def setBlockSymbol(block_symbol) 
        @block_symbol = block_symbol 
    end
end