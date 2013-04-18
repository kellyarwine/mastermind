module Mastermind
  class Board
    attr_accessor :turn_history

    def initialize
      @turn_history = []
    end

    def store_turn(move, feedback)
      @turn_history << [move, feedback]
    end
  end
end