module Mastermind
  class ConsoleIo

    def input
      $stdin
    end

    def output
      $stdout
    end

    def display(message)
      output.puts message
    end

    def get
      input.gets.chomp
    end

    def get_move
      # require 'pry'
      # binding.pry
      get.split("")
    end

    def display_invalid_input_message
      display("Your input was invalid.  Please try again.")
    end

    def display_welcome_message
      display("
Welcome to Mastermind!
")
    end

    def display_move_prompt(moves_remaining, available_symbols)
      display("You have #{moves_remaining} moves remaining.
Please enter your guess from the following options:
#{available_symbols.join(", ")}
(Example: rgyb)")
    end

    def display_win_message
      display("Woohoo!  You win!")
    end

    def display_lose_message
      display("You lose.  Better luck next time.")
    end

    def display_play_again_prompt
      display("Would you like to play again? (y/n)")
    end

    def display_gameboard(move_history)
      display(construct_gameboard(move_history))
    end

    def construct_gameboard(move_history)
      board_header +
      board_headings +
      board_row(move_history) +
      board_footer
    end

    private

      def board_header
        "
 -----------------------------------------------------------------------
|                                            .                          |
|                                           .o8                         |
|    ooo. .oo.  .oo.    .oooo.    .oooo.o .o888oo  .ooooo.  oooo d8b    |
|     888P Y88bP Y88b   P  )88b  d88(   8   888   d88   88b  888  8P    |
|     888   888   888   .oP 888    Y88b.    888   888ooo888  888        |
|     888   888   888  d8(  888  o.  )88b   888 . 888    .o  888        |
|    o888o o888o o888o  Y8888 8o 8oo888P'    888   Y8bod8P  d888b       |
|                                                                       |
|                                o8o                    .o8             |
|                                8o8                    888             |
|             ooo. .oo.  .oo.   oooo  ooo. .oo.    .oooo888             |
|              888P Y88bP Y88b  `888   888P Y88b  d88   888             |
|              888   888   888   888   888   888  888   888             |
|              888   888   888   888   888   888  888   888             |
|             o888o o888o o888o o888o o888o o888o  oY8bod8o             |
 -----------------------------------------------------------------------
|                                   |                                   |
"
      end

      def board_headings
        "|                TURN               |             FEEDBACK              |
|                                   |                                   |
 -----------------------------------------------------------------------
|                                   |                                   |
"
      end

      def board_row(move_history)
        string = ""
        move_history.each do |move|
          string << left_edge_border + parse_move(move) + border + "\n"
        end
        string
      end

      def parse_move(move)
        string = ""
        string << parse_move_part(move.first)
        string << border
        string << parse_move_part(move.last)
        string
      end

      def parse_move_part(part)
        string = ""

        part.each { |char| string << ("%0" + space_per_character.to_s + "s") % char }

        string
      end

      def space_per_character
        7
      end

      def border
        ("%0" + (space_per_character + 1).to_s + "s") % "|"
      end

      def left_edge_border
        "|"
      end

      def board_footer
        "|                                   |                                   |
 -----------------------------------------------------------------------
 "
      end

  end
end