module Mastermind
  class Validations

    def invalid_selection?(selection, selections_options)
      not selections_options.include? selection
    end

    def invalid_move?(guess_array, available_symbols, secret_code_length)
      invalid_guess_length?(guess_array, secret_code_length) || invalid_guess_symbol?(guess_array, available_symbols)
    end

    def invalid_guess_length?(guess_array, secret_code_length)
      guess_array.length != secret_code_length
    end

    def invalid_guess_symbol?(guess_array, available_symbols)
      guess_array - available_symbols != []
    end

  end
end