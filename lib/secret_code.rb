require 'game_rules'

class SecretCode
  attr_reader :code, :game_rules

  def initialize(game_rules)
    @game_rules = game_rules
  end

  def code_generator
    @code = Array.new
    code_length = @game_rules.secret_code_length
    code_length.times { @code << @game_rules.available_symbols.sample }
  end

end