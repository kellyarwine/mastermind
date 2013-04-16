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

  def turn_number
    12
  end

  def color_symbols
    ['red', 'green', 'blue', 'yellow', 'orange',
    'purple', 'gray', 'brown', 'silver', 'pink',
     'orange', 'maroon', 'forest green', 'fuchsia', 'teal',
     'cyan', 'coral', 'salmon', 'puce', 'lavender',
     'indigo', 'mauve', 'coral', 'chartreuse', 'charcoal']
  end

  def shape_symbols
    ['star', 'heart', 'circle', 'diamond', 'hexagon',
    'rectangle', 'square', 'plus', 'octagon', 'triangle']
  end

end