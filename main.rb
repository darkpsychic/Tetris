require 'ruby2d'
require_relative 'lib/Util'
require_relative 'lib/Block'
require_relative 'lib/Tetromino/Tetromino'
require_relative 'lib/Block'
require_relative 'lib/Constant/Constant'
require_relative 'lib/Board'


set width: Constant::Width, height: Constant::Height

board = Board.new

tick = 0
update do
    if Window.fps > 60
        sleep ((Window.fps-60.0) / 1000.0)
    end
    board.run
end

show