module Mastermind
  class Prompter
    attr_reader :console_io, :validations

    PLAY_AGAIN_SELECTIONS = {
      'y' => true,
      'n' => false
    }

    def initialize(console_io, validations)
      @console_io = console_io
      @validations = validations
    end

    def move(moves_remaining, available_symbols, secret_code_length)
      response = get_move(moves_remaining, available_symbols)

      while @validations.invalid_move?(response, available_symbols, secret_code_length)
        @console_io.display_invalid_input_message
        response = get_move(moves_remaining, available_symbols)
      end

      response
    end

    def get_move(moves_remaining, available_symbols)
      @console_io.display_move_prompt(moves_remaining, available_symbols)
      @console_io.get_move
    end

    def play_again?
      response = get_play_again

      while @validations.invalid_selection?(response, PLAY_AGAIN_SELECTIONS.keys)
        @console_io.display_invalid_input_message
        response = get_play_again
      end

      PLAY_AGAIN_SELECTIONS[response]
    end

    def get_play_again
      @console_io.display_play_again_prompt
      @console_io.get
    end

  end
end