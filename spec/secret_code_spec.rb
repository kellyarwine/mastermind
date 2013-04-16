require 'secret_code'
require 'game_rules'

describe SecretCode do

  let(:game_rules) { GameRules.new              }
  let(:subject)    { SecretCode.new(game_rules) }

    it 'has a length of 4' do
      subject.code_generator
      subject.code.length.should == 4
    end

    it 'only contains available symbols' do
      subject.code_generator
      intersection = subject.code & game_rules.available_symbols
      intersection.length.should == subject.code.uniq.length
    end

    xit 'is random' do
      subject.game_rules.available_symbols.should_receive(:sample).exactly(4).times
      subject.code_generator
    end

end