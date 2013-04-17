module Mastermind
  class GameRules

    def secret_code_length
      4
    end

    def available_symbols
      available_symbol_group[0..number_of_available_symbols - 1]
    end

    def available_symbol_group
      color_symbols
    end

    def number_of_available_symbols
      6
    end

    def total_moves
      12
    end

    def color_symbols
      ['Red', 'Green', 'Blue', 'Yellow', 'Orange',
      'Purple', 'Gray', 'Brown', 'Silver', 'Pink',
       'Orange', 'Maroon', 'Forest Green', 'Fuchsia', 'Teal',
       'Cyan', 'Coral', 'Salmon', 'Puce', 'Lavender',
       'Indigo', 'Mauve', 'Coral', 'Chartreuse', 'Charcoal']
    end

    def shape_symbols
      ['Star', 'Heart', 'Circle', 'Diamond', 'Hexagon',
      'Rectangle', 'Square', 'Plus', 'Octagon', 'Triangle']
    end

    def game_over?(moves_remaining, guess, secret_code)
      no_moves_remaining?(moves_remaining) || game_win?(guess, secret_code)
    end

    def game_win?(guess, secret_code)
      guess == secret_code
    end

    def no_moves_remaining?(moves_remaining)
      moves_remaining == 0
    end

  end
end