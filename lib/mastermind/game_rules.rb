module Mastermind
  class GameRules

    def total_moves
      12
    end

    def game_over?(feedback, moves_remaining)
      no_moves_remaining?(moves_remaining) || game_win?(feedback)
    end

    def game_win?(feedback)
      feedback != nil && feedback.uniq == ['b']
    end

    def no_moves_remaining?(moves_remaining)
      moves_remaining == 0
    end

  end
end