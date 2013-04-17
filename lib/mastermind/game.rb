require 'mastermind/secret_code'
require 'mastermind/board'

module Mastermind
  class Game

    def initialize(prompter, console_io, game_rules)
      @prompter = prompter
      @console_io = console_io
      @game_rules = game_rules
      @board = Board.new
    end

    def call
      start_game
      run_game
      end_game
    end

    def start_game
      get_secret_code
      display_welcome_message
      set_moves_remaining
    end

    def run_game
      while not game_over?
        display_gameboard
        get_move
        store_move
        decrement_moves_remaining
      end
    end

    def end_game
      game_win? ? display_win_message : display_lose_message
    end

    def get_secret_code
      @secret_code = SecretCode.new(@game_rules).get_secret_code
    end

    def display_welcome_message
      @console_io.display_welcome_message
    end

    def set_moves_remaining
      @moves_remaining = @game_rules.total_moves
    end

    def game_over?
      @game_rules.game_over?(@move, @secret_code, @moves_remaining)
    end

    def decrement_moves_remaining
      @moves_remaining -= 1
    end

    def display_gameboard
      @console_io.display_gameboard(@board.move_history)
    end

    def get_move
      @move = @prompter.move(@moves_remaining, @game_rules.available_symbols)
    end

    def store_move
      @board.store_move(@move)
    end

  end
end