require 'spec_helper'

describe Mastermind::Prompter do

  let(:game_rules)   { Mastermind::GameRules.new                          }
  let(:console_io)   { Mastermind::ConsoleIo.new                          }
  let(:validations)  { Mastermind::Validations.new                        }
  let(:subject)      { Mastermind::Prompter.new(console_io, validations, game_rules)  }

  it 'has a console_io and a validations instance' do
    subject.console_io.should be_kind_of(Mastermind::ConsoleIo)
    subject.validations.should be_kind_of(Mastermind::Validations)
  end

  context '#move' do
    it 'returns a valid move' do
      subject.console_io.should_receive(:display_move_prompt)
      subject.console_io.should_receive(:get_move).and_return(['blue','blue','blue','blue'])
      subject.move.should == ['blue','blue','blue','blue']
    end

    it 'returns a valid move after 2 invalid inputs are made' do
      subject.console_io.should_receive(:display_move_prompt).exactly(3).times
      subject.console_io.should_receive(:get_move).and_return(['blue','blue','blue'], ['blue','blue','blue','magenta'], ['blue','blue','blue','blue'])
      subject.console_io.should_receive(:display_invalid_input_message).exactly(2).times
      subject.move.should == ['blue','blue','blue','blue']
    end
  end

  context '#play_again?' do
    it 'returns a play_again? selection of true' do
      subject.console_io.should_receive(:display_play_again_prompt)
      subject.console_io.should_receive(:prompt).and_return('y')
      subject.play_again?.should be_true
    end

    it 'returns a play_again? selection of true after 2 invalid selections are made' do
      subject.console_io.should_receive(:display_play_again_prompt).exactly(3).times
      subject.console_io.should_receive(:prompt).and_return(1, '', 'y')
      subject.console_io.should_receive(:display_invalid_input_message).exactly(2).times
      subject.play_again?.should be_true
    end

    it 'returns a play_again? selection of false after 2 invalid selections are made' do
      subject.console_io.should_receive(:display_play_again_prompt).exactly(3).times
      subject.console_io.should_receive(:prompt).and_return('.', '', 'n')
      subject.console_io.should_receive(:display_invalid_input_message).exactly(2).times
      subject.play_again?.should be_false
    end
  end

end