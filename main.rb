require 'ruby2d'
require_relative 'lib/Util'
require_relative 'lib/Block'
require_relative 'lib/Tetromino/Tetromino'
require_relative 'lib/Block'
require_relative 'lib/Constant/Constant'
require_relative 'lib/Board'


set title: "Tetris", width: Constant::Width, height: Constant::Height

board = Board.new

update do
    
    if Window.fps > Constant::FPS
        sleep ((Window.fps-Constant::FPS.to_f) / 1000.0)
    end
    board.run
end

show