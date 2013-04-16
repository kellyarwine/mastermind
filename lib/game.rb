require 'console_io'
require 'game_rules'

class Game

  def call
    @game_rules = GameRules.new
    @console_io = ConsoleIo.new(@game_rules)
    turns = [
    [["a","b","c","d"],["e","f"]],
    [["b","b","b","b"],["w","w","b"]],
    [["b","b","b","b"],["w","w","b","b"]],
    [["b","b","b","b"],["w","w","b"]],
    [["b","b","b","b"],["w","w","b"]],
    ]
    @console_io.display_gameboard(turns)
  end
end