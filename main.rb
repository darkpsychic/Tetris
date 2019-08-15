require 'ruby2d'
require_relative 'lib/Util'
require_relative 'lib/Block'
require_relative 'lib/Tetromino/Tetromino'
require_relative 'lib/Block'
require_relative 'lib/Constant/Constant'
require_relative 'lib/Board'


set width: Constant::Width, height: Constant::Height

Util::draw_lines

b = Board.new

t = b.drop
tick = 0
update do
    b.update
end

show