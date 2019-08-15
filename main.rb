require 'ruby2d'
require_relative 'lib/Util'
require_relative 'lib/Block'
require_relative 'lib/Tetromino/Tetromino'
require_relative 'lib/Block'
require_relative 'lib/Constant/Constant'
require_relative 'lib/Board'


set width: Constant::Width, height: Constant::Height

board = Board.new

t = board.drop
tick = 0
update do
    board.update
end

show