require 'spec_helper'

describe Mastermind::GameRunner do

  it 'has console_io, validations, game_rules and prompter instances' do
    subject.console_io.should be_kind_of(Mastermind::ConsoleIo)
    subject.validations.should be_kind_of(Mastermind::Validations)
    subject.prompter.should be_kind_of(Mastermind::Prompter)
  end

end