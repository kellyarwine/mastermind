module Mastermind
  class SecretCode
    attr_reader :code, :game_rules

    def get_secret_code
      secret_code = []

      secret_code_length.times {
        secret_code << random_symbol
      }

      secret_code
    end

    def random_symbol
      available_symbols.sample.downcase
    end

    def secret_code_length
      4
    end

    def available_symbols
      symbols[0..number_of_available_symbols - 1]
    end

    def symbols
      ['r', 'g', 'b', 'y', 'o',
       'p', 's', 'p', 'o', 'm',
       'gry', 'brwn', 'fg', 'f', 't',
       'c', 'cor', 'sal', 'puc', 'l',
       'i', 'mauv', 'crm', 'char', 'coal']
    end

    def number_of_available_symbols
      6
    end

  end
end