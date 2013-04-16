class ConsoleIo
  attr_accessor :game_rules

  def initialize(game_rules)
    @game_rules = game_rules
  end

  def input
    $stdin
  end

  def output
    $stdout
  end

  def display(message)
    output.puts message
  end

  def display_gameboard(turns)
    display(construct_gameboard(turns))
  end

  def construct_gameboard(turns)
    board_header +
    board_headings +
    board_row(turns) +
    board_footer
  end

  def board_header
" -----------------------------------------------------------------------
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

  def board_row(turns)
    string = ""
    turns.each do |turn|
      string << left_edge_border + parse_turn(turn) + border + "\n"
    end
    string
  end

  def parse_turn(turn)
    string = ""
    string << parse_turn_part(turn.first)
    string << border
    string << parse_turn_part(turn.last)
    string
  end

  def parse_turn_part(part)
    string = ""

    part.each do |char|
      string << ("%0" + space_per_character.to_s + "s") % char
    end

    return pad_turn_part(string)
  end

  def space_per_character
    7
  end

  def pad_turn_part(string)
    ("%-" + turn_part_size.to_s + "s") % string
  end

  def turn_part_size
    @game_rules.secret_code_length * space_per_character
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