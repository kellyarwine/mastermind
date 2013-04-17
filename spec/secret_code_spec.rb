require 'spec_helper'

describe Mastermind::SecretCode do

  let(:game_rules) { Mastermind::GameRules.new              }
  let(:subject)    { Mastermind::SecretCode.new(game_rules) }

    it 'has a length of 4' do
      subject.get_secret_code
      subject.code.length.should == 4
    end

    it 'only contains available symbols' do
      subject.get_secret_code
      intersection = subject.code & game_rules.available_symbols
      intersection.length.should == subject.code.uniq.length
    end

    xit 'is random' do
      subject.game_rules.available_symbols.should_receive(:sample).exactly(4).times
      subject.get_secret_code
    end

end