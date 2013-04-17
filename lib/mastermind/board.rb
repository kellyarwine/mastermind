module Mastermind
  class Board
    attr_accessor :move_history

    def initialize
      @move_history = []
    end

    def store_move(move)
      @move_history << [move]
    end
  end
end