require 'mastermind/console_io'
require 'mastermind/validations'
require 'mastermind/prompter'
require 'mastermind/game'

module Mastermind
  class GameRunner
    attr_reader :console_io, :validations, :prompter

    def initialize
      @console_io  = ConsoleIo.new
      @validations = Validations.new
      @prompter = Prompter.new(@console_io, @validations)
    end

    def play_game
      Game.new(@prompter, @console_io).call
      play_game if @prompter.play_again?
    end

  end
end