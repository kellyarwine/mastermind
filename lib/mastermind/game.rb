require 'mastermind/game_rules'
require 'mastermind/board'
require 'mastermind/feedback'
require 'mastermind/secret_code'

module Mastermind
  class Game
    attr_reader :prompter, :console_io, :game_rules, :board, :feedback, :secret_code, :code, :feedback, :moves_remaining

    def initialize(prompter, console_io)
      @prompter = prompter
      @console_io = console_io
      @game_rules = GameRules.new
      @board = Board.new
      @feedback = Feedback.new
      @secret_code = SecretCode.new
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
        get_feedback
        store_turn
        decrement_moves_remaining
      end
    end

    def end_game
      display_gameboard
      game_win? ? display_win_message : display_lose_message
    end

    def get_secret_code
      @code = @secret_code.get_secret_code
    end

    def display_welcome_message
      @console_io.display_welcome_message
    end

    def set_moves_remaining
      @moves_remaining = @game_rules.total_moves
    end

    def game_over?
      @game_rules.game_over?(@move_feedback, @moves_remaining)
    end

    def display_gameboard
      @console_io.display_gameboard(@board.turn_history)
    end

    def get_move
      @move = @prompter.move(@moves_remaining, @secret_code.available_symbols, @secret_code.secret_code_length)
    end

    def get_feedback
      @move_feedback = @feedback.get_feedback(@move.dup, @code.dup)
    end

    def store_turn
      @board.store_turn(@move, @move_feedback)
    end

    def decrement_moves_remaining
      @moves_remaining -= 1
    end

    def game_win?
      @game_rules.game_win?(@move, @code)
    end

    def display_win_message
      @console_io.display_win_message
    end

    def display_lose_message
      @console_io.display_lose_message
    end

  end
end