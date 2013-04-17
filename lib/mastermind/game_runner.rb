require 'mastermind/console_io'
require 'mastermind/validations'
require 'mastermind/game_rules'
require 'mastermind/prompter'
require 'mastermind/game'

module Mastermind
  class GameRunner

    def initialize
      @console_io  = ConsoleIo.new
      @validations = Validations.new
      @game_rules  = GameRules.new
      @prompter = Prompter.new(@console_io, @validations, @game_rules)
    end

    def play_game
      Game.new(@prompter, @console_io, @game_rules).call
      play_game if @prompter.play_again?
    end

  end
end