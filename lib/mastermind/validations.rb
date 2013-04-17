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
      first_letters = first_letter_of_available_symbols(available_symbols)
      guess_array - first_letters != []
    end

    def first_letter_of_available_symbols(available_symbols)
      first_letters = []

      available_symbols.each do |sym|
        first_letters << sym[0].downcase
      end

      first_letters
    end

  end
end